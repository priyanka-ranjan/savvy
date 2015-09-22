

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
    }
    return self;
}

- (void)getCoupons {
    
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=%f&lon=%f&page=%d&key=%@", 40.4, 20.4, 20 , @"1f5718c16a7fb3a5452f45193232"];
    
    [self.sessionManager GET:urlAsString
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
    NSDictionary *parameters = @{@"foo": @"bar"};
    NSURL *filePath = [NSURL fileURLWithPath:@"file://path/to/image.png"];
    
    [self.sessionManager POST:@""
                   parameters:parameters
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                          [self.delegate requestPassedWithResponse:responseObject];
                      } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                          [self.delegate requestFailedWithError:error];
                      }];
}
@end
