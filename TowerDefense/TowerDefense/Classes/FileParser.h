//
//  FileParser.h
//  TowerDefense
//
//  Created by Alex Yuan on 9/19/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileParser : NSObject

-(id) initWithFileName: (NSString*) filename;
-(NSArray*)getLineFromNumber:(int) num;
-(NSArray*)getFileHeader;
-(NSArray*)getColumnFromNumber:(int) num;
@end
