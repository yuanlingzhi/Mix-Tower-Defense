//
//  AppConfig.h
//  TowerDefense
//
//  Created by Alex Yuan on 9/19/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConfig : NSObject
+ (AppConfig *)sharedAppConfig;
+(id)alloc;
-(id)init;
@property (nonatomic, strong) NSDictionary* appConfigMap;
@end
