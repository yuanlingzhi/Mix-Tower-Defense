//
//  CreepView.h
//  TowerDefense
//
//  Created by Alex Yuan on 10/2/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "CCSprite.h"
#import "CreepModel.h"

@interface CreepView : CCSprite

@property (nonatomic) CreepModel* creepModel;


-(id) initWithCreepModel: (NSMutableArray*) data initPosition: (CGPoint) initPosition;

@end
