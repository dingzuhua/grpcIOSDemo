#import "GrpcDemoOne.pbrpc.h"
#import "GrpcDemoOne.pbobjc.h"

#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>

@implementation DemoOneService

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  return (self = [super initWithHost:host packageName:@"" serviceName:@"DemoOneService"]);
}

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}

+ (instancetype)serviceWithHost:(NSString *)host {
  return [[self alloc] initWithHost:host];
}


#pragma mark communication(DemoOneRequest) returns (DemoOneResponse)

/**
 * 服务中的方法，传过来一个DemoOneRequest类型的对象，返回一个DemoOneResponse类型的对象
 */
- (void)communicationWithRequest:(DemoOneRequest *)request handler:(void(^)(DemoOneResponse *_Nullable response, NSError *_Nullable error))handler{
  [[self RPCTocommunicationWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
/**
 * 服务中的方法，传过来一个DemoOneRequest类型的对象，返回一个DemoOneResponse类型的对象
 */
- (GRPCProtoCall *)RPCTocommunicationWithRequest:(DemoOneRequest *)request handler:(void(^)(DemoOneResponse *_Nullable response, NSError *_Nullable error))handler{
  return [self RPCToMethod:@"communication"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[DemoOneResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleHandler:handler]];
}
@end
