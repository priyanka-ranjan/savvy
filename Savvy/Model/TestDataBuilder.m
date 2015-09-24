

#import "TestDataBuilder.h"
#import "CouponModel.h"

@interface TestDataBuilder ()

@property (strong, nonatomic) NSArray *brands;
@property (strong, nonatomic) NSArray *discounts;
@property (strong, nonatomic) NSArray *products;

@end

@implementation TestDataBuilder

- (CouponModel *) newRandomCoupon {
    int random_brand = arc4random() % 32;
    int random_dis = arc4random() % 8;
    int random_prod = arc4random() % 15;
    
    CouponModel *newCoupon = [[CouponModel alloc] init];
    newCoupon.storeName = [self.brands objectAtIndex:random_brand];
    newCoupon.storeDiscount = [self.discounts objectAtIndex:random_dis];
    newCoupon.productType = [self.products objectAtIndex:random_prod];
    newCoupon.userCouponString = @"444-XXX";
    return newCoupon;
}

- (NSArray *) brands {
    return @[@"Abercrombie Fitch", @"Aeropostale", @"ALDO", @"American Eagle Outfitters", @"Ardene", @"Aritzia", @"Armani Exchange", @"Banana Republic", @"BCBGMAXAZRIA", @"Bench", @"Bluenotes", @"Club Monaco", @"Dynamite", @"Eddie Bauer", @"Forever 21", @"Garage", @"H&M", @"Harry Rosen", @"Hollister", @"Hot Topic", @"JCrew", @"La Vie En Rose", @"Lids", @"Lululemon Athletica", @"Old Navy", @"Reitmans", @"Roots", @"RW&Co", @"Scotch and Soda", @"Spring Lucky", @"TNA", @"Zara"];
}

- (NSArray *) discounts {
    return @[@"8% OFF", @"9% OFF", @"10% OFF", @"11% OFF", @"12% OFF", @"13% OFF", @"14% OFF", @"15% OFF"];
}

- (NSArray *) products {
    return @[@"Accessories", @"Outerwear", @"Shorts", @"Shirts", @"You Next Purchase", @"Bottoms", @"Sweaters", @"Pants", @"Polos", @"Skirts", @"Jeans", @"Blazers", @"Tops", @"Dresses", @"Tees"];
}

@end
