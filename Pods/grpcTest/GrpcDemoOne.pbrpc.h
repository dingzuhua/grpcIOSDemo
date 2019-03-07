#if !GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
#import "GrpcDemoOne.pbobjc.h"
#endif

#import <ProtoRPC/ProtoService.h>
#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriteable.h>
#import <RxLibrary/GRXWriter.h>

#if GPB_GRPC_FORWARD_DECLARE_MESSAGE_PROTO
  @class DemoOneRequest;
  @class DemoOneResponse;
#else
#endif


NS_ASSUME_NONNULL_BEGIN

@protocol DemoOneService <NSObject>

#pragma mark communication(DemoOneRequest) returns (DemoOneResponse)

/**
 * 服务中的方法，传过来一个DemoOneRequest类型的对象，返回一个DemoOneResponse类型的对象
 */
- (void)communicationWithRequest:(DemoOneRequest *)request handler:(void(^)(DemoOneResponse *_Nullable response, NSError *_Nullable error))handler;

/**
 * 服务中的方法，传过来一个DemoOneRequest类型的对象，返回一个DemoOneResponse类型的对象
 */
- (GRPCProtoCall *)RPCTocommunicationWithRequest:(DemoOneRequest *)request handler:(void(^)(DemoOneResponse *_Nullable response, NSError *_Nullable error))handler;


@end

/**
 * Basic service implementation, over gRPC, that only does
 * marshalling and parsing.
 */
@interface DemoOneService : GRPCProtoService<DemoOneService>
- (instancetype)initWithHost:(NSString *)host NS_DESIGNATED_INITIALIZER;
+ (instancetype)serviceWithHost:(NSString *)host;
@end

NS_ASSUME_NONNULL_END
