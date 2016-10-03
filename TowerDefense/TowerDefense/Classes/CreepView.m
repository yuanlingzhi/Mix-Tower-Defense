//
//  CreepView.m
//  TowerDefense
//
//  Created by Alex Yuan on 10/2/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "CreepView.h"

@implementation CreepView

-(id) initWithCreepModel: (NSMutableArray*) data initPosition: (CGPoint) initPosition{
    self = [super init];
    self.positionType = CCPositionTypeNormalized;
    _creepModel = [CreepModel alloc];
    _creepModel.name = data[0];
    _creepModel.hp = [data[1] floatValue];
    _creepModel.mp = [data[2] floatValue];
    _creepModel.pic = data[3];
    _creepModel.exp = [data[4] intValue];
    _creepModel.money = [data[5] intValue];
    _creepModel.attact_attr = data[6];
    
    self.position = initPosition;
    
    return self;
}


@end
