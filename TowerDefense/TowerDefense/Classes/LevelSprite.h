//
//  LevelSprite.h
//  TowerDefense
//
//  Created by Alex Yuan on 9/19/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "CCSprite.h"
#import "FileParser.h"
#import "CreepLoader.h"
@interface LevelSprite : CCSprite

-(id) initWithMapConfig:(FileParser*) fileParseHandler FileLineNumber:(int)lineNumber;

@end
