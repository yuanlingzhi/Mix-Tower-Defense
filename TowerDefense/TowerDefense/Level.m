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
}
-(id) initWithMapConfig: (FileParser*) fileParseHandler FileLineNumber:(int)lineNumber{
    self = [super init];
    _levelSprite = [[LevelSprite alloc] initWithMapConfig:fileParseHandler FileLineNumber:lineNumber];
    _levelSprite.positionType = CCPositionTypeNormalized;
    _levelSprite.position = (CGPoint){0.5, 0.5};
    CGSize windowSize = [CCDirector sharedDirector].viewSize;
    CGSize spriteSize = _levelSprite.contentSize;
    _levelSprite.scaleX = windowSize.width / spriteSize.width;
    _levelSprite.scaleY = windowSize.height / spriteSize.height;
    [self addChild:_levelSprite];
    return self;
}

@end
