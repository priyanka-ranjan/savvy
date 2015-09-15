

#import <UIKit/UIKit.h>
@class CouponModel;

@interface CouponButton : UIButton

@property (nonatomic, strong) CouponModel *couponModel;

- (void)setupButtonForCouponModel:(CouponModel *)couponModel;

@end
