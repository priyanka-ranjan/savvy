

#import "NetworkingManager.h"
#import <AFNetworking/AFNetworking.h>

#import "CouponModel.h"

@interface NetworkingManager ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation NetworkingManager

+ (NetworkingManager *)sharedInstance {
    static NetworkingManager *sharedInstance;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _sessionManager = [AFHTTPSessionManager manager];
//        _sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html"]];
    }
    return self;
}

- (void)getCoupons {
//    http://c95ff889.ngrok.io/api/coupons
    //http://getsavvy.info/api/coupons
    [self.sessionManager GET:@"http://getsavvy.info/api/coupons" //@"http://129598a5.ngrok.io/api/coupons"
                  parameters:nil
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                         [self.delegate requestPassedWithResponse:responseObject];
                         NSLog(@"JSON: %@", responseObject);
                     } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                         NSLog(@"Error: %@", error);
                         [self.delegate requestFailedWithError:error];
                     }];
}


- (void)postCouponModel:(CouponModel *)coupon {
    //http://c95ff889.ngrok.io/api/coupons/app
    NSDictionary *parameters = @{@"clienCouponCode": coupon.clientCouponString};
    [self.sessionManager POST:@"http://getsavvy.info/api/coupons/app"
                   parameters:parameters
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                          [self.delegate requestPassedWithResponse:responseObject];
                      } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                          [self.delegate requestFailedWithError:error];
                      }];
}
@end
