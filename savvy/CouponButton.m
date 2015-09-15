

#import "CouponButton.h"
#import "CouponModel.h"

@implementation CouponButton

- (void)setupButtonForCouponModel:(CouponModel *)couponModel {
    
    self.backgroundColor = [UIColor whiteColor];
    self.couponModel = couponModel;
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView *brandimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 70.0)];
    brandimg.clipsToBounds = YES;
    brandimg.image = [UIImage imageNamed:couponModel.storeName];
    brandimg.contentMode = UIViewContentModeScaleAspectFill;
    [self addSubview:brandimg];
    
    UIImageView *brandName = [[UIImageView alloc] initWithFrame:CGRectMake(0, 70, self.frame.size.width, 30)];
    NSMutableString *name = [[NSMutableString alloc] init];
    [name appendString:couponModel.storeName];
    [name appendString:@"_logo"];
    brandName.image = [UIImage imageNamed:name];
    brandName.clipsToBounds = YES;
    brandName.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:brandName];
    
    UILabel *product = [[UILabel alloc] initWithFrame:CGRectMake(0, 113, self.frame.size.width, 12)];
    product.text = couponModel.productType;
    product.textAlignment = NSTextAlignmentCenter;
    product.font = [UIFont fontWithName:@"TFArrow-Light" size:15];
    [self addSubview:product];
    
    UILabel *discount = [[UILabel alloc] initWithFrame:CGRectMake(0, 99, self.frame.size.width, 12.0)];
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
