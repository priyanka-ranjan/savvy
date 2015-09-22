

#import "WalletButton.h"

#import "CouponModel.h"

@implementation WalletButton

- (void)setupButtonWithCouponModel:(CouponModel *)couponModel {
    
    for (UIView *view in self.subviews){
        [view removeFromSuperview];
    }
    
    CALayer *myLayer = self.layer;
    [myLayer setCornerRadius:10.0];
    [myLayer setBorderColor:[UIColor blackColor].CGColor];
    [myLayer setBorderWidth:1.5];
    [self.layer setMasksToBounds:YES];
    
    self.backgroundColor = [UIColor whiteColor];
    self.couponModel = couponModel;
    self.isOccupied = YES;
    
    UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.frame.size.width - 10, self.frame.size.width - 10)];
    NSMutableString *name_wallet = [[NSMutableString alloc] init];
    [name_wallet appendString:couponModel.storeName];
    [name_wallet appendString:@"_logo"];
    brandName_wallet.image = [UIImage imageNamed:name_wallet];
    brandName_wallet.clipsToBounds = YES;
    brandName_wallet.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:brandName_wallet];
}
@end
