//
//  LevelOption.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/12/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "LevelOption.h"
#import "FileParser.h"
#import "Level.h"

@implementation LevelOption
{
    NSString* _level;
    CCLabelTTF* _label;
    FileParser* _fileHandler;
    int _configFileLineNumber;
}

- (id)initWithNamePosition:(NSString*)level Position:(CGPoint)position FileParserHandler:(FileParser*)FileParserHandler LineNumber:(int) LineNumber{
    self = [super init];
    _fileHandler = FileParserHandler;
    _configFileLineNumber = LineNumber;
    _level = level;
    _label = [CCLabelTTF labelWithString:_level fontName:@"ArialMT" fontSize:24];
    _label.positionType = CCPositionTypeNormalized;
    _label.anchorPoint = CGPointMake(0.5, 0.5);
    _label.position = CGPointMake(0.5, 0.5);
    self.contentSize = CGSizeMake(60, 50);
    CCNodeColor * node = [[CCNodeColor alloc] initWithColor:[CCColor redColor] width:60 height:50];
    node.positionType = CCPositionTypeNormalized;
    node.anchorPoint = CGPointMake(0.5, 0.5);
    node.position = CGPointMake(0.5, 0.5);
    [self addChild:node];
    self.positionType = CCPositionTypeNormalized;
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.position = position;
    [self addChild:_label];
    self.userInteractionEnabled = YES;
    
    return self;
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    Level* level = [[Level alloc] initWithMapConfig:_fileHandler FileLineNumber:_configFileLineNumber];
    [[CCDirector sharedDirector] pushScene: level];
}


@end
