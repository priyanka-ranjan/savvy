

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

    /*[
     {
     "code":"10PERCOFF",
     "is_active":true,
     "discount_percent":10,
     "title_primary":"Collection Numero Uno",
     "title_secondary":"Sec Title - Uno",
     "campaign_id":"56035bab79ee271a2b5e05ed",
     "store_id":"5603567c79ee271a2b5e05e3",
     "product_skus":[
     "sku-api-test-1",
     "sku-001"
     ]
     }
     ]
     */
    
    if (response && [response isKindOfClass:[NSArray class]]) {
        NSDictionary *couponDictionary = [response objectAtIndex:0];
        if (couponDictionary || YES) {
            CouponModel *newCoupon = [CouponModel new];
            newCoupon.storeName = @"Banana Republic";
            newCoupon.storeDiscount = [NSString stringWithFormat:@"%@%% OFF",[[couponDictionary valueForKey:@"discount_percent"] stringValue]];
            newCoupon.collectionType = [couponDictionary objectForKey:@"title_primary"];
            newCoupon.productType = [couponDictionary objectForKey:@"title_secondary"];
            newCoupon.campaignId = [couponDictionary objectForKey:@"campaign_id"];
            newCoupon.storeId = [couponDictionary objectForKey:@"store_id"];
            newCoupon.userCouponString = [couponDictionary objectForKey:@"code"];
            newCoupon.productSkus = [couponDictionary objectForKey:@"product_skus"];
            
            [self.delegate serviceRecievedNewCoupon:newCoupon];
        }
    } else if (response && [response isKindOfClass:[NSDictionary class]]){
        NSDictionary *couponDictionary = response;
        if (couponDictionary || YES) {
            CouponModel *newCoupon = [CouponModel new];
            newCoupon.storeName = @"Banana Republic";
            newCoupon.storeDiscount = [NSString stringWithFormat:@"%@%% OFF",[[couponDictionary valueForKey:@"discount_percent"] stringValue]];
            newCoupon.collectionType = [couponDictionary objectForKey:@"title_primary"];
            newCoupon.productType = [couponDictionary objectForKey:@"title_secondary"];
            newCoupon.campaignId = [couponDictionary objectForKey:@"campaign_id"];
            newCoupon.storeId = [couponDictionary objectForKey:@"store_id"];
            newCoupon.userCouponString = [couponDictionary objectForKey:@"code"];
            newCoupon.productSkus = [couponDictionary objectForKey:@"product_skus"];
            
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
