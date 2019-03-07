//
//  ClientManager.h
//  grpcTest
//
//  Created by  dingzuhua on 2019/3/7.
//  Copyright © 2019 izhaohu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GrpcDemoOne.pbobjc.h"

NS_ASSUME_NONNULL_BEGIN

@interface ClientManager : NSObject
-(void)communicationTest:(NSString *)message handler:(void(^)(DemoOneResponse *_Nullable response, NSError *_Nullable error))handler;
@end

NS_ASSUME_NONNULL_END
