//
//  Level.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/21/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "Level.h"
@implementation Level
{
    LevelSprite* _levelSprite;
    CCButton* _returnButton;
}
-(id) initWithMapConfig: (FileParser*) fileParseHandler FileLineNumber:(int)lineNumber{
    self = [super init];
    _levelSprite = [[LevelSprite alloc] initWithMapConfig:fileParseHandler FileLineNumber:lineNumber];
    _levelSprite.positionType = CCPositionTypeNormalized;
    _levelSprite.position = (CGPoint){0.5, 0.5};
    CGSize windowSize = [CCDirector sharedDirector].viewSize;
    CGSize spriteSize = _levelSprite.contentSize;
    CGFloat scale = windowSize.height * 0.8 / spriteSize.height;
    _levelSprite.scale = scale;
    
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
    [self addChild:_levelSprite];
    
    return self;
}

-(void)forwardToSetting{
    [[CCDirector sharedDirector] pushScene: [SettingScene new]];
}

-(void) returnClicked{
    [[CCDirector sharedDirector] popScene];
}

@end
