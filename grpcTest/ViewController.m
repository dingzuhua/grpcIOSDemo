//
//  ViewController.m
//  grpcTest
//
//  Created by  dingzuhua on 2019/3/7.
//  Copyright © 2019 izhaohu. All rights reserved.
//

#import "ViewController.h"
#import "ClientManager.h"

@interface ViewController ()
@property (nonatomic, strong) ClientManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [[ClientManager alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendAction:(id)sender {
    if(self.inputView.text.length<=0){
        self.showText.text = @"请输入要发送的内容(这不是服务器返回)";
        self.showText.textColor = [UIColor redColor];
        return;
    }
    [self.manager communicationTest:self.inputView.text handler:^(DemoOneResponse *response,NSError *error){
        if(error){
            self.showText.text = [NSString stringWithFormat:@"%@(错误)",error];
            self.showText.textColor = [UIColor redColor];
        }else{
            self.showText.text = [NSString stringWithFormat:@"%@(这是服务器返回)",response.message];
            self.showText.textColor = [UIColor blackColor];
        }
    }];
}

@end
