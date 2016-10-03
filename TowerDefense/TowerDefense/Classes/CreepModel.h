//
//  CreepModel.h
//  TowerDefense
//
//  Created by Alex Yuan on 10/2/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CreepModel : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) float hp;
@property (nonatomic) float mp;
@property (nonatomic) NSString* pic;
@property (nonatomic) int exp;
@property (nonatomic) int money;
@property (nonatomic) NSString* attact_attr;

@end
