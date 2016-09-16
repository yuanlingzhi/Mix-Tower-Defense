//
//  HelloWorldScene.m
//
//  Created by : LIU YUJIE
//  Project    : TowerDefense
//  Date       : 9/5/16
//
//  Copyright (c) 2016 Alex.
//  All rights reserved.
//
// -----------------------------------------------------------------

#import "HelloWorldScene.h"
#import "SettingScene.h"
#import "OALSimpleAudio.h"
#import "LevelPickScene.h"
// -----------------------------------------------------------------------

@implementation HelloWorldScene

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    
    // The thing is, that if this fails, your app will 99.99% crash anyways, so why bother
    // Just make an assert, so that you can catch it in debug
    NSAssert(self, @"Whoops");
    
    // Background
    CCSprite9Slice *background = [CCSprite9Slice spriteWithImageNamed:@"white_square.png"];
    background.anchorPoint = CGPointZero;
    background.contentSize = [CCDirector sharedDirector].viewSize;
    background.color = [CCColor grayColor];
    [self addChild:background];
    
    // The standard Hello World text
    CCButton *startButton = [CCButton buttonWithTitle:@"Start Game" fontName:@"ArialMT" fontSize:30];
    startButton.positionType = CCPositionTypeNormalized;
    startButton.position = (CGPoint){0.5, 0.5};
    [startButton setTarget:self selector:@selector(forwardToLevelPicking)];
    [self addChild:startButton];
    
    CCButton *settingButton = [CCButton buttonWithTitle:@"Setting" fontName:@"ArialMT" fontSize:16];
    settingButton.positionType = CCPositionTypeNormalized;
    settingButton.position = (CGPoint){0.9, 0.9};
    [settingButton setTarget:self selector:@selector(forwardToSetting)];
    [self addChild:settingButton];
    
    [[OALSimpleAudio sharedInstance] playBg:@"Track02.mp3" loop:YES];
    
    // done
    return self;
}

-(void) forwardToSetting{
    [[CCDirector sharedDirector] pushScene: [SettingScene new]];
}

-(void) forwardToLevelPicking
{
    LevelPickScene* levelPickScene = [[LevelPickScene alloc] initWithNumber:8 totalLevels:6];
    [[CCDirector sharedDirector] pushScene: levelPickScene];
}

// -----------------------------------------------------------------------

@end























// why not add a few extra lines, so we dont have to sit and edit at the bottom of the screen ...
