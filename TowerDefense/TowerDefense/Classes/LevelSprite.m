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
    NSMutableDictionary* _config;
}

-(id) initWithMapConfig: (NSMutableDictionary*) config{
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
    self = [super init];
    _config = config;
    
}

@end
