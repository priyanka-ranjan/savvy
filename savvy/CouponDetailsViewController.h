

#import <UIKit/UIKit.h>

@class CouponModel;

@protocol CouponDetailsViewControllerDelegate <NSObject>

-(void)userPressedAddToWalletForCoupon:(CouponModel *)coupon;

@end

@interface CouponDetailsViewController : UIViewController

@property (nonatomic, weak)id<CouponDetailsViewControllerDelegate> delegate;

- (void)setupViewWithCouponModel:(CouponModel *)coupon
                        isCoupon:(BOOL)isCoupon
                        delegate:(id)delegate;

@end
