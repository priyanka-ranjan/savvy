

#import <Foundation/Foundation.h>
#import "CouponModel.h"


@protocol SwipeServiceProtocol <NSObject>

- (void)serviceRecievedFailedNetworkRequest;

@optional
- (void)serviceRecievedNewCoupon:(CouponModel *) coupon;
@end


@interface SwipeService : NSObject

@property (nonatomic, weak) id <SwipeServiceProtocol> delegate;
- (void)getNewCoupon;
-(void)postCouponToRedeem:(CouponModel *)coupon;

@end
