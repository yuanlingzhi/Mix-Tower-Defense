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
    CCButton* _returnButton;
    CCButton* _leftArrow;
    CCButton* _rightArrow;
}
- (id)initWithNumber:(int)onepageNumber totalLevels:(int)totalLevels{
    self = [super init];
    float leftMargin = 0.05;
    float rightMargin = 0.05;
    float topMargin = 0.1;
    float botMargin = 0.1;
    float increment = (1-leftMargin-rightMargin)/(  (onepageNumber/2) > 0 ? (onepageNumber/2) : 3  );
    float firstRow = 0.7;
    float secondRow = 0.4;
    float tempLeftMargin = leftMargin;
    for(int i=0;i<onepageNumber/2 && i<totalLevels ;i++){
        CGPoint tempPoint = (CGPoint){(increment)/2+tempLeftMargin, firstRow};
        tempLeftMargin += increment;
        LevelOption* levelOption = [[LevelOption alloc] initWithNamePosition:[@(i+1) stringValue] Position:tempPoint];
        [self addChild:levelOption];
        [_levels addObject:levelOption];
    }
    tempLeftMargin = leftMargin;
    for(int i=0;i<onepageNumber/2 && i<totalLevels-onepageNumber/2 ;i++){
        CGPoint tempPoint = (CGPoint){(increment)/2+tempLeftMargin, secondRow};
        tempLeftMargin += increment;
        LevelOption* levelOption = [[LevelOption alloc] initWithNamePosition:[@(i+1+onepageNumber/2) stringValue] Position:tempPoint];
        [self addChild:levelOption];
        [_levels addObject:levelOption];
    }
    
    CCButton *settingButton = [CCButton buttonWithTitle:@"Setting" fontName:@"ArialMT" fontSize:16];
    settingButton.positionType = CCPositionTypeNormalized;
    settingButton.position = (CGPoint){0.9, 0.9};
    [settingButton setTarget:self selector:@selector(forwardToSetting)];
    [self addChild:settingButton];
    
    
    _returnButton = [CCButton buttonWithTitle:@"Return" fontName:@"ArialMT" fontSize:24];
    _returnButton.positionType = CCPositionTypeNormalized;
    _returnButton.anchorPoint = (CGPoint){0.5, 0};
    _returnButton.position = (CGPoint){0.5, 0};
    [_returnButton setTarget:self selector:@selector(returnClicked)];
    [self addChild:_returnButton];
    
    _leftArrow = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"leftArrowButton.png"]];
    _leftArrow.positionType = CCPositionTypeNormalized;
    _leftArrow.anchorPoint = CGPointMake(0.5, 0.5);
    _leftArrow.position = CGPointMake(0.05, 0.5);
    [_leftArrow setTarget:self selector:@selector(leftArrowClicked)];
    [self addChild:_leftArrow];
    
    _rightArrow = [CCButton buttonWithTitle:@"" spriteFrame:[CCSpriteFrame frameWithImageNamed:@"rightArrowButton.png"]];
    _rightArrow.positionType = CCPositionTypeNormalized;
    _rightArrow.anchorPoint = CGPointMake(0.5, 0.5);
    _rightArrow.position = CGPointMake(0.95, 0.5);
    [_rightArrow setTarget:self selector:@selector(rightArrowClicked)];
    [self addChild:_rightArrow];
    
    
    return self;
}

-(void) leftArrowClicked{
    
}

-(void) rightArrowClicked{
    
}

-(void)forwardToSetting{
    [[CCDirector sharedDirector] pushScene: [SettingScene new]];
}

-(void) returnClicked{
    [[CCDirector sharedDirector] popScene];
}

@end
