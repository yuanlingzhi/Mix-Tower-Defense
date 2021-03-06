//
//  LevelSprite.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/19/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "LevelSprite.h"


@implementation LevelSprite
{
    int _level_id;
    NSString* _map_name;
    NSArray* _map_data;
    NSString* _map_bg_pic;
    float _height;
    float _width;
    NSMutableArray* _stop_points;
    NSArray* _waves;
}

-(id) initWithMapConfig: (FileParser*) fileParseHandler FileLineNumber:(int)lineNumber{
    /*
     
     config keys should have:
     {
        level_id,
        map_name,
        map_data_csv,
        map_background_pic,
        width,
        height
     }

     */
    
    NSArray* config = [fileParseHandler getLineFromNumber:lineNumber];
    NSString* map_bg_pic = config[3];

    self = [self initWithImageNamed:map_bg_pic];
    
    _level_id = [config[0] intValue];
    _map_name = config[1];
    _map_data = [self parseCSVtoTwoDimensionArray: config[2]];
    _map_bg_pic = config[3];
    _width = [config[4] floatValue];
    _height= [config[5] floatValue];
    _stop_points = [NSMutableArray new];
    NSArray<NSString*>* stop_point_set = [config[6] componentsSeparatedByString:@";"];
    for( NSString* item in stop_point_set){
        NSArray<NSString*>* temp = [item componentsSeparatedByString:@":"];
        CGPoint point = {[temp[0] intValue], [temp[1] intValue]};
        [_stop_points addObject: NSStringFromCGPoint(point)];
    }
    
    // inside of waves are strings, the format is <int>:<int>
    // first int represents creep type
    // second int represents creep amount
    _waves = [config[7] componentsSeparatedByString:@";"];
    [self gameStarts];
    return self;
}

-(NSArray*) parseCSVtoTwoDimensionArray: (NSString*) sourceName{
    FileParser* csvFileParser = [[FileParser alloc] initWithFileName:sourceName];
    NSMutableArray* res = [NSMutableArray new];
    for(int i =0; i < [csvFileParser getRowNumberWithoutHeader]; i++){
        NSArray* cells = [csvFileParser getLineFromNumber:i];
        if(cells.count != 0){
            [res addObject:cells];
        }
    }
    return res;
}

-(void) gameStarts{
    NSDictionary* creepDataMap = [[CreepLoader sharedCreepLoader] creepDataMap];
}

@end
