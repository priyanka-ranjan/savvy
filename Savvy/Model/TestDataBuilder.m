

#import "TestDataBuilder.h"
#import "CouponModel.h"

@interface TestDataBuilder ()

@property (strong, nonatomic) NSArray *brands;
@property (strong, nonatomic) NSArray *discounts;
@property (strong, nonatomic) NSArray *products;
@property (strong, nonatomic) NSArray *collections;

@end

@implementation TestDataBuilder
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

- (CouponModel *) newRandomCoupon {
    int random_brand = arc4random() % (self.brands.count - 1);
    int random_dis = arc4random() % (self.discounts.count - 1);
    int random_prod = arc4random() % (self.products.count - 1);
    int random_collections = arc4random() % (self.collections.count -1);
    
    CouponModel *newCoupon = [[CouponModel alloc] init];
    newCoupon.storeName = [self.brands objectAtIndex:random_brand];
    newCoupon.storeDiscount = [self.discounts objectAtIndex:random_dis];
    newCoupon.collectionType = [self.collections objectAtIndex:random_collections];
    newCoupon.productType = [self.products objectAtIndex:random_prod];
    newCoupon.campaignId = @"56035bab79ee271a2b5e05ed";
    newCoupon.storeId = @"5603567c79ee271a2b5e05e3";
    newCoupon.userCouponString = @"XXX-YYY";
    newCoupon.productSkus = @[
                              @"sku-api-test-2",
                              @"sku-002"];
    return newCoupon;
}
// @"Banana Republic"
- (NSArray *) brands {
    return @[@"Abercrombie Fitch", @"Aeropostale", @"ALDO", @"American Eagle Outfitters", @"Ardene", @"Aritzia", @"Armani Exchange", @"BCBGMAXAZRIA", @"Bench", @"Bluenotes", @"Club Monaco", @"Dynamite", @"Eddie Bauer", @"Forever 21", @"Garage", @"H&M", @"Harry Rosen", @"Hollister", @"Hot Topic", @"JCrew", @"La Vie En Rose", @"Lids", @"Lululemon Athletica", @"Old Navy", @"Reitmans", @"Roots", @"RW&Co", @"Scotch and Soda", @"Spring Lucky", @"TNA", @"Zara"];
}

- (NSArray *)collections {
    return @[@"Spring Sale", @"Fall Sale" , @"Winter Sale", @"Summer Sale", @"Chinese New Year Sale", @"Valentines Sale", @"St Patrick's Day Sale"];
}

- (NSArray *) discounts {
    return @[@"8% OFF", @"9% OFF", @"10% OFF", @"11% OFF", @"12% OFF", @"13% OFF", @"14% OFF", @"15% OFF"];
}

- (NSArray *) products {
    return @[@"Accessories", @"Outerwear", @"Shorts", @"Shirts", @"Bottoms", @"Sweaters", @"Pants", @"Polos", @"Skirts", @"Jeans", @"Blazers", @"Tops", @"Dresses", @"T-Shirts"];
}

@end
