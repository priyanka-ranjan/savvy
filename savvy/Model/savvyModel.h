//
//  savvyModel.h
//  Savvy
//
//  Created by Eric Chen on 2014-06-12.
//  Copyright (c) 2014 Savvy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface savvyModel : NSObject

@property (strong, nonatomic) NSArray *brands;
@property (strong, nonatomic) NSArray *discounts;
@property (strong, nonatomic) NSArray *products;

- (NSArray *) newTikkit;
- (NSArray *) returnBrands;


@end
