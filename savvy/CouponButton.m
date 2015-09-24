

#import "CouponButton.h"
#import "CouponModel.h"

@implementation CouponButton

- (void)setupButtonForCouponModel:(CouponModel *)couponModel {
    
    self.backgroundColor = [UIColor whiteColor];
    self.couponModel = couponModel;
    
    CALayer *myLayer = self.layer;
    [myLayer setCornerRadius:10.0];
    [myLayer setBorderColor:[UIColor blackColor].CGColor];
    [myLayer setBorderWidth:1.5];
    [self.layer setMasksToBounds:YES];
    
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView *branding = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 70.0)];
    branding.clipsToBounds = YES;
    branding.image = [UIImage imageNamed:couponModel.storeName];
    branding.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:branding];
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(5, 80, self.frame.size.width - 10, 50)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:couponModel.storeName];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.clipsToBounds = YES;
    brandName.contentMode = UIViewContentModeScaleToFill;
    [self addSubview:brandName];
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 135, self.frame.size.width, 15)];
    product.text = couponModel.productType;
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [self addSubview:product];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, self.frame.size.width, 15)];
    discount.text = couponModel.storeDiscount;
    discount.textAlignment = NSTextAlignmentCenter;
    discount.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [self addSubview:discount];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.center = CGPointMake(self.superview.frame.size.width/2 - self.frame.size.width/2,
                                  self.superview.frame.size.height/2 - self.frame.size.height/2);
    }];
}

@end
