//
//  MyCheckbox.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/5/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "MyCheckbox.h"

@implementation MyCheckbox
{
    CCButton* _checkbox;
    CCLabelTTF* _label;
}
-(id)initWithImageAndTest:(NSString*)title fontName:(NSString*) fontName fontSize:(float)fontSize highlightedSpriteFrameSourceFile:(NSString*)highlightedSpriteFrameSourceFile spriteFrame:(NSString*) spriteFrameFileName
{
    self = [super init];
    _label = [CCLabelTTF labelWithString:title fontName:fontName fontSize:fontSize];
    _label.positionType = CCPositionTypeNormalized;
    _label.anchorPoint = CGPointMake(0, 0.5);
    _label.position = CGPointMake(0.5, 0.5);
    CCSpriteFrame* highlightedSpriteFrame;
    CCSpriteFrame* spriteFrame;
    highlightedSpriteFrame = [CCSpriteFrame frameWithImageNamed:highlightedSpriteFrameSourceFile];
    spriteFrame = [CCSpriteFrame frameWithImageNamed:spriteFrameFileName];
    _checkbox =[CCButton buttonWithTitle:@"" spriteFrame:spriteFrame highlightedSpriteFrame:highlightedSpriteFrame disabledSpriteFrame:nil];
    _checkbox.togglesSelectedState = YES;
    _checkbox.positionType = CCPositionTypeNormalized;
    _checkbox.anchorPoint = CGPointMake(1, 0.5);
    _checkbox.position = CGPointMake(0.5, 0.5);
    [self addChild:_checkbox];
    [self addChild:_label];
    return self;
}

-(void) setLabel:(NSString*) title{
    if(_label != nil){
        _label.string = title;
    }
}

-(void)setSelected:(BOOL)selected
{
    _checkbox.selected = selected;
}

-(BOOL)selected
{
    return _checkbox.selected;
}

-(void)setTarget:(id)target sel:(SEL)selector
{
    [_checkbox setTarget:target selector:selector];
}

@end
