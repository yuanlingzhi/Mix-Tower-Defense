//
//  LevelPickScene.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/12/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "LevelPickScene.h"


@implementation LevelPickScene
{
    NSMutableArray* _levels;
}
- (id)initWithNumber:(int)onepageNumber totalLevels:(int)totalLevels{
    self = [super init];
    float leftMargin = 0.1;
    float rightMargin = 0.1;
    float topMargin = 0.1;
    float botMargin = 0.1;
    float increment = (1-leftMargin-rightMargin)/(  (onepageNumber/2) > 0 ? (onepageNumber/2) : 3  );
    float firstRow = 0.3;
    float secondRow = 0.6;
    
    for(int i=0;i<onepageNumber/2 ;i++){
        CGPoint tempPoint = (CGPoint){(i+1)*increment+leftMargin, firstRow};
        LevelOption* levelOption = [[LevelOption alloc] initWithNamePosition:[@(i+1) stringValue] Position:tempPoint];
        [self addChild:levelOption];
        [_levels addObject:levelOption];
    }
    
    for(int i=0;i<onepageNumber/2 ;i++){
        CGPoint tempPoint = (CGPoint){(i+1)*increment+leftMargin, secondRow};
        LevelOption* levelOption = [[LevelOption alloc] initWithNamePosition:[@(i+1+onepageNumber/2) stringValue] Position:tempPoint];
        [self addChild:levelOption];
        [_levels addObject:levelOption];
    }
    
    return self;
}

@end
