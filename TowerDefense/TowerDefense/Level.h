//
//  Level.h
//  TowerDefense
//
//  Created by Alex Yuan on 9/21/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "CCScene.h"
#import "FileParser.h"
#import "LevelSprite.h"
#import "cocos2d.h"
#import "cocos2d-ui.h"
@interface Level : CCScene

-(id) initWithMapConfig: (FileParser*) fileParseHandler FileLineNumber:(int)lineNumber;

@end
