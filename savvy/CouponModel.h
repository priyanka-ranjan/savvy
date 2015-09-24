//
//  CouponModel.h
//  savvy
//
//  Created by Priyanka on 2015-09-14.
//  Copyright (c) 2015 Savvy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CouponModel : NSObject

@property (nonatomic, strong) NSString *storeName;
@property (nonatomic, strong) NSString *storeDiscount;
@property (nonatomic, strong) NSString *productType;
@property (nonatomic, strong) NSString *userCouponString;
@property (nonatomic, strong) NSString *clientCouponString;

@end
