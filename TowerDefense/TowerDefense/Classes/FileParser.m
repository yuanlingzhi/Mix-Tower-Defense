//
//  FileParser.m
//  TowerDefense
//
//  Created by Alex Yuan on 9/19/16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "FileParser.h"

@implementation FileParser

{
    NSMutableArray<NSString*>* _fileLines;
    NSArray<NSString*>* _fileHeader;
}


-(id) initWithFileName: (NSString*) filename{
    self = [super init];
    _fileLines = [NSMutableArray new];
    
    NSString *filepath = [[NSBundle mainBundle] pathForResource:[[filename lastPathComponent] stringByDeletingPathExtension] ofType:filename.pathExtension];
    NSData* data = [NSData dataWithContentsOfFile:filepath];
    NSString* fileContents = [[NSString alloc] initWithBytes:[data bytes]
                                                length:[data length]
                                              encoding:NSUTF8StringEncoding];
    NSArray* rows = [fileContents componentsSeparatedByString:@"\n"];
    BOOL firstLine = YES;
    for (NSString *row in rows){
        if( firstLine ){
            _fileHeader = [row componentsSeparatedByString:@","];
            firstLine =NO;
        }else{
            [_fileLines addObject:row];
        }
    }
    return self;
}

-(NSArray*)getFileHeader{
    return _fileHeader;
}

-(NSArray*)getLineFromNumber:(int) num{
    NSString* line = [_fileLines objectAtIndex:num];
    NSArray<NSString*>* lineDetail = [line componentsSeparatedByString:@","];
    return lineDetail;
}

-(NSArray*)getColumnFromNumber:(int) num{
    NSMutableArray* res = [NSMutableArray new];
    for(NSString* row in _fileLines){
        [res addObject: [row componentsSeparatedByString:@","][num]];
    }
    return res;
}
@end
