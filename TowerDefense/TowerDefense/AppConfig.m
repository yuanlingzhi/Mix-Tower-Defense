//
//  AppConfig.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/19/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "AppConfig.h"

@implementation AppConfig

static AppConfig *_sharedAppConfig = nil;

+ (AppConfig *)sharedAppConfig
{
    if (!_sharedAppConfig) {
        _sharedAppConfig = [[AppConfig alloc] init];
    }
    
    return _sharedAppConfig;
}

+(id)alloc
{
    NSAssert(_sharedAppConfig == nil, @"Attempted to allocate a second instance of a singleton.");
    return [super alloc];
}

-(id)init{
    self = [super init];
    NSString * jsonString = @"{ \
         \"mapsConfig\": \"mapsConfig.csv\"                        \
    }";
    NSStringEncoding  encoding;
    NSData * jsonData = [jsonString dataUsingEncoding:encoding];
    NSError * error=nil;
    _appConfigMap = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
    return self;
}

@end
