//
//  SettingScene.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/5/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SettingScene.h"
#import "OALSimpleAudio.h"
#import "MyCheckbox.h"

@implementation SettingScene
{
    MyCheckbox* _musicCheckbox;
    MyCheckbox* _soundCheckbox;
    CCButton* returnButton;
}


- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    
    // The thing is, that if this fails, your app will 99.99% crash anyways, so why bother
    // Just make an assert, so that you can catch it in debug
    NSAssert(self, @"Whoops");
    NSString* fontName =@"ArialMT";
    NSString* spriteFrameSourceFile = @"unchecked.png";
    NSString* highlightedSpriteFrameSourceFile = @"checked.png";
    float fontSize = 12;
    
    // Background
    CCSprite9Slice *background = [CCSprite9Slice spriteWithImageNamed:@"white_square.png"];
    background.anchorPoint = CGPointZero;
    background.contentSize = [CCDirector sharedDirector].viewSize;
    background.color = [CCColor grayColor];
    [self addChild:background];
    
    // The standard Hello World text
    _musicCheckbox = [[MyCheckbox alloc] initWithImageAndTest:@"music" fontName:fontName fontSize:fontSize highlightedSpriteFrameSourceFile:highlightedSpriteFrameSourceFile spriteFrame:spriteFrameSourceFile];
    _musicCheckbox.positionType = CCPositionTypeNormalized;
    [_musicCheckbox setPosition:(CGPoint){0.5, 0.6}];
    [_musicCheckbox setTarget:self sel:@selector(clickMusic:)];
    _musicCheckbox.selected = ![[OALSimpleAudio sharedInstance] paused];
    [self addChild:_musicCheckbox];
    
    _soundCheckbox = [[MyCheckbox alloc] initWithImageAndTest:@"sound" fontName:fontName fontSize:fontSize highlightedSpriteFrameSourceFile:highlightedSpriteFrameSourceFile spriteFrame:spriteFrameSourceFile];
    _soundCheckbox.positionType = CCPositionTypeNormalized;
    [_soundCheckbox setPosition:(CGPoint){0.5, 0.45}];
    [self addChild:_soundCheckbox];
    
    
    returnButton = [CCButton buttonWithTitle:@"Return" fontName:@"ArialMT" fontSize:24];
    returnButton.positionType = CCPositionTypeNormalized;
    returnButton.anchorPoint = (CGPoint){0.5, 0};
    returnButton.position = (CGPoint){0.5, 0};
    [returnButton setTarget:self selector:@selector(buttonClicked)];
    [self addChild:returnButton];
    
    
    // done
    return self;
}

-(void) buttonClicked{
    [[CCDirector sharedDirector] popScene];
}

-(void)clickMusic:(CCButton *)button
{
    if (button.selected) {
        [[OALSimpleAudio sharedInstance] setPaused:NO];
    } else {
        [[OALSimpleAudio sharedInstance] setPaused:YES];
    }
}

@end
