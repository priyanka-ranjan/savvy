

#import "SwipeService.h"
#import "NetworkingManager.h"

@interface SwipeService () <NetworkingManagerDelegate>

@property (nonatomic, strong) NetworkingManager *networkingManager;

@end

@implementation SwipeService

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupNetworkingManager];
    }
    return self;
}

- (void)setupNetworkingManager {
    self.networkingManager = [[NetworkingManager alloc]init];
    self.networkingManager.delegate = self;
}


#pragma mark - Public Methods

-(void)getNewCoupon {
    [self.networkingManager getCoupons];
}

-(void)postCouponToRedeem:(CouponModel *)coupon{
    [self.networkingManager postCouponModel:coupon];
}


#pragma mark - <NetworkingManagerDelegate>

- (void)requestPassedWithResponse:(id)response {
    NSLog(@"-------- The response is: %@", response);
    NSArray *arrayOfCoupons = [response objectForKey:@"CouponsArray"];
//    CouponModel *coupon = [response objectForKey:@"coupon"];
    if (arrayOfCoupons.count){
        NSDictionary *couponDictionary = [arrayOfCoupons objectAtIndex:0];
        if (couponDictionary || YES) {
            CouponModel *newCoupon = [CouponModel new];
            newCoupon.storeName = @"Network Store Name";
            newCoupon.storeDiscount = @"Network Discount: %12";
            newCoupon.productType = @"Network Product Type";
            newCoupon.userCouponString = @"333-XXX";
            
            [self.delegate serviceRecievedNewCoupon:newCoupon];
        }
    }
        //TODO: The post request succes response will also come here
}

- (void)requestFailedWithError:(NSError *)error {
    NSLog(@"------------ It failed because: %@",error);
    [self.delegate serviceRecievedFailedNetworkRequest];
}

@end
