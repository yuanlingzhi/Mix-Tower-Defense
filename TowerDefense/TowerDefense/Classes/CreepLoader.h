//
//  CreepLoader.h
//  TowerDefense
//
//  Created by Alex Yuan on 10/2/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileParser.h"

@interface CreepLoader : NSObject
+ (CreepLoader *)sharedCreepLoader;
+(id)alloc;
-(id)init;
@property (nonatomic, strong) NSMutableDictionary* creepDataMap;
@end
