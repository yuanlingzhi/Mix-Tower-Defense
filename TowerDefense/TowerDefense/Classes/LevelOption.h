//
//  LevelOption.h
//  TowerDefense
//
//  Created by Alex Yuan on 9/12/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "CCSprite.h"
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "FileParser.h"
#import "SettingScene.h"
@interface LevelOption : CCSprite

- (id)initWithNamePosition:(NSString*)level Position:(CGPoint)position FileParserHandler:(FileParser*)FileParserHandler LineNumber:(int) LineNumber;

@end
