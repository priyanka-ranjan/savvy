//
//  savvyModel.m
//  Savvy
//
//  Created by Eric Chen on 2014-06-12.
//  Copyright (c) 2014 Savvy. All rights reserved.
//

#import "savvyModel.h"

@implementation savvyModel

- (NSArray *) newTikkit
{
    _brands = @[@"Banana Republic", @"Zara", @"Club Monaco", @"H&M", @"JCrew"];
    _discounts = @[@"8% OFF", @"9% OFF", @"10% OFF", @"11% OFF", @"12% OFF", @"13% OFF", @"14% OFF", @"15% OFF"];
    _products = @[@"Accessories", @"Outerwear", @"Shorts", @"Shirts", @"You Next Purchase", @"Bottoms", @"Sweaters", @"Pants", @"Polos", @"Skirts", @"Jeans", @"Blazers", @"Tops", @"Dresses", @"Tees"];
    int random_brand = arc4random() % 5;
    int random_dis = arc4random() % 8;
    int random_prod = arc4random() % 15;
    NSString *index = [@(random_brand) stringValue];
    NSArray *newTik = @[[_brands objectAtIndex:random_brand], [_discounts objectAtIndex:random_dis], index, [_products objectAtIndex:random_prod]];
    return newTik;
}

- (NSArray *) returnBrands
{
    return _brands = @[@"Banana Republic", @"Zara", @"Club Monaco", @"H&M", @"JCrew"];
}

@end
