//
//  ClientManager.m
//  grpcTest
//
//  Created by  dingzuhua on 2019/3/7.
//  Copyright © 2019 izhaohu. All rights reserved.
//

#import "ClientManager.h"
#import "GrpcDemoOne.pbrpc.h"
#import <GRPCClient/GRPCCall+ChannelArg.h>
#import <GRPCClient/GRPCCall+Tests.h>
@interface ClientManager ()
@property (nonatomic, strong) DemoOneService *service;
@end
@implementation ClientManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        [GRPCCall useInsecureConnectionsForHost:@"127.0.0.1:50001"];
        [GRPCCall setUserAgentPrefix:@"DemoOneService" forHost:@"127.0.0.1:50001"];
        self.service = [[DemoOneService alloc] initWithHost:@"127.0.0.1:50001"];
    }
    return self;
}

-(void)communicationTest:(NSString *)message handler:(void(^)(DemoOneResponse *_Nullable response, NSError *_Nullable error))handler{
    DemoOneRequest *reques = [[DemoOneRequest alloc] init];
    reques.message = message;
    [self.service communicationWithRequest:reques handler:handler];
}
@end
