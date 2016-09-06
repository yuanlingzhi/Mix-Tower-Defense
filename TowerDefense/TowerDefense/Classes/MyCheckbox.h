//
//  MyCheckbox.h
//  TowerDefense
//
//  Created by Alex Yuan on 9/5/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "cocos2d-ui.h"


@interface MyCheckbox : CCNode
-(id)initWithImageAndTest:(NSString*)title fontName:(NSString*) fontName fontSize:(float)fontSize highlightedSpriteFrameSourceFile:(NSString*)highlightedSpriteFrameSourceFile spriteFrame:(NSString*) spriteFrameFileName;
-(void) setLabel:(NSString*) title;
-(void)setTarget:(id)target sel:(SEL)selector;

@property (nonatomic, readwrite) BOOL selected;

@end
