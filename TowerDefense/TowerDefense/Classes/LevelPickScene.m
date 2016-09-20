//
//  LevelPickScene.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/12/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "LevelPickScene.h"
#import "FileParser.h"
#import "AppConfig.h"
@implementation LevelPickScene
{
    NSMutableArray* _levels;
    CCButton* _returnButton;
    CCButton* _leftArrow;
    CCButton* _rightArrow;
    CGPoint _previousPosition;
    int _direction;
    FileParser* _fileParserHandler;
}
- (id)initWithConfig{
    self = [super init];
    _fileParserHandler = [[FileParser alloc] initWithFileName: [AppConfig sharedAppConfig].appConfigMap[@"mapsConfig"]];
    NSArray* levelNames = [_fileParserHandler getColumnFromNumber:1];
    int totalLevels = (int)levelNames.count;
    int onepageNumber = 6;
    _direction = 0; //1 is left, -1 is right
    float leftMargin = 0.05;
    float rightMargin = 0.05;
    float topMargin = 0.1;
    float botMargin = 0.1;
    float increment = (1-leftMargin-rightMargin)/(  (onepageNumber/2) > 0 ? (onepageNumber/2) : 3  );
    float firstRow = 0.7;
    float secondRow = 0.4;
    float firstRowLeftMargin = 0;
    float secondRowLeftMargin = 0;
    _levels = [NSMutableArray new];
    int remainLevels = totalLevels;
    int i = 0;
    while(remainLevels != 0){
        firstRowLeftMargin += leftMargin;
        for(int j = 0 ;j<onepageNumber/2 && remainLevels != 0 ;i++,j++){
            CGPoint tempPoint = (CGPoint){(increment)/2+firstRowLeftMargin, firstRow};
            firstRowLeftMargin += increment;
            LevelOption* levelOption = [[LevelOption alloc] initWithNamePosition:levelNames[i] Position:tempPoint];
            [self addChild:levelOption];
            [_levels addObject:levelOption];
            remainLevels--;
        }
        firstRowLeftMargin += rightMargin;
        
        
        secondRowLeftMargin += leftMargin;
        for(int j = 0 ;j<onepageNumber/2 && remainLevels != 0 ;i++, j++){
            CGPoint tempPoint = (CGPoint){(increment)/2+secondRowLeftMargin, secondRow};
            secondRowLeftMargin += increment;
            LevelOption* levelOption = [[LevelOption alloc] initWithNamePosition:levelNames[i] Position:tempPoint];
            [self addChild:levelOption];
            [_levels addObject:levelOption];
            remainLevels--;
        }
        secondRowLeftMargin += rightMargin;
    }
    if(_levels.count != 0){
        _previousPosition = ((LevelOption*)(_levels[0])).position;
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

-(void)update:(CCTime)delta{
    if(_direction == 0){
        return;
    }
    if( fabs(_previousPosition.x - ((LevelOption*)_levels[0]).position.x) >=1 ){
        _previousPosition = ((LevelOption*)(_levels[0])).position;
        _direction = 0;
        return;
    }
    
    for(int i = 0; i < _levels.count; i++){
        LevelOption* temp = _levels[i];
        if(_direction == 1){
            temp.position = CGPointMake(temp.position.x-0.01, temp.position.y);
        }
        else{
            temp.position = CGPointMake(temp.position.x+0.01, temp.position.y);
        }
    }
}

-(void) leftArrowClicked{
    float firstOptionXPosition = ((LevelOption*)_levels[0]).position.x;
    if(firstOptionXPosition > 0 && firstOptionXPosition < 1){
        return;
    }
    _direction = -1;
}

-(void) rightArrowClicked{
    float lastOptionXPosition = ((LevelOption*)_levels[_levels.count-1]).position.x;
    if(lastOptionXPosition > 0 && lastOptionXPosition < 1){
        return;
    }
    _direction = 1;
}

-(void)forwardToSetting{
    [[CCDirector sharedDirector] pushScene: [SettingScene new]];
}

-(void) returnClicked{
    [[CCDirector sharedDirector] popScene];
}

@end
