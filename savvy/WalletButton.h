

#import <UIKit/UIKit.h>

@class CouponModel;

@interface WalletButton : UIButton

@property (nonatomic, strong) CouponModel *couponModel;
@property (nonatomic, assign) BOOL isOccupied;

- (void)setupButtonWithCouponModel:(CouponModel *)couponModel;

@end
