

#import "WalletButton.h"

#import "CouponModel.h"

@implementation WalletButton

- (void)setupButtonWithCouponModel:(CouponModel *)couponModel {
    
    self.backgroundColor = [UIColor whiteColor];
    self.couponModel = couponModel;
    self.isOccupied = YES;
    
    UIImageView *brandName_wallet = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    NSMutableString *name_wallet = [[NSMutableString alloc] init];
    [name_wallet appendString:couponModel.storeName];
    [name_wallet appendString:@"_logo"];
    brandName_wallet.image = [UIImage imageNamed:name_wallet];
    brandName_wallet.clipsToBounds = YES;
    brandName_wallet.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:brandName_wallet];
}
@end
