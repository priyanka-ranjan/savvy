//
//  CouponModel.h
//  savvy
//
//  Created by Priyanka on 2015-09-14.
//  Copyright (c) 2015 Savvy. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface CouponModel : NSObject

@property (nonatomic, strong) NSString *storeName;
@property (nonatomic, strong) NSString *storeDiscount;
@property (nonatomic, strong) NSString *collectionType;
@property (nonatomic, strong) NSString *productType;
@property (nonatomic, strong) NSString *campaignId;
@property (nonatomic, strong) NSString *storeId;
@property (nonatomic, strong) NSString *userCouponString;
@property (nonatomic, strong) NSString *clientCouponString;
@property (nonatomic, strong) NSArray *productSkus;
@end
