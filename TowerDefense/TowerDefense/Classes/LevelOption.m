//
//  LevelOption.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/12/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "LevelOption.h"

@implementation LevelOption
{
    NSString* _level;
    CCLabelTTF* _label;
}

- (id)initWithNamePosition:(NSString*)level Position:(CGPoint)position{
    self = [super init];
    _level = level;
    _label = [CCLabelTTF labelWithString:_level fontName:@"ArialMT" fontSize:24];
    
    CCNodeColor * node = [[CCNodeColor alloc] initWithColor:[CCColor redColor] width:60 height:50];
    node.anchorPoint = CGPointMake(0.5, 0.5);
    [self addChild:node];
    self.positionType = CCPositionTypeNormalized;
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.position = position;
    [self addChild:_label];
    return self;
}

@end
