//
//  CreepLoader.m
//  TowerDefense
//
//  Created by Alex Yuan on 10/2/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "CreepLoader.h"

@implementation CreepLoader

static CreepLoader* _sharedCreepLoader = nil;
+ (CreepLoader *)sharedCreepLoader
{
    if (!_sharedCreepLoader) {
        _sharedCreepLoader = [[CreepLoader alloc] init];
    }
    
    return _sharedCreepLoader;
}

+(id)alloc
{
    NSAssert(_sharedCreepLoader == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

-(id)init{
    self = [super init];
    
    FileParser* fileHandler = [[FileParser alloc] initWithFileName:@"creeps.csv"];
    _creepDataMap = [NSMutableDictionary new];
    for(int i =0 ; i < fileHandler.getRowNumberWithoutHeader; i++){
        NSMutableArray* line = [[fileHandler getLineFromNumber:i] mutableCopy];
        NSString* key = line[i];
        [line removeObjectAtIndex:0];
        [_creepDataMap addEntriesFromDictionary: @{ key: line}];
    }

    return self;
}


@end
