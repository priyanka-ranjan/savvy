

#import <Foundation/Foundation.h>
@class CouponModel;

@protocol NetworkingManagerDelegate <NSObject>

- (void)requestPassedWithResponse:(id)response;
- (void)requestFailedWithError:(NSError *)error;

@end

@interface NetworkingManager : NSObject

@property (nonatomic, weak) id<NetworkingManagerDelegate> delegate;

+ (NetworkingManager *)sharedInstance;

- (void)getCoupons;
- (void)postCouponModel:(CouponModel *)coupon;


@end
