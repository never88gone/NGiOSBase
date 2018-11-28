//
//  OTSFileManager.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSFileManager.h"

@implementation OTSFileManager

+ (NSString *)appDocPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appLibPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appCachePath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (BOOL)isFileExsit:(NSString *)aPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:aPath];
}

+ (BOOL)isFileExsitInDoc:(NSString *)aPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *path = [OTSFileManager appDocPath];
    [path stringByAppendingPathComponent:aPath];
    return [manager fileExistsAtPath:path];
}

+ (BOOL)isBundleExsit:(NSString *)aBundleName
{
    return [[NSBundle mainBundle] URLForResource:aBundleName withExtension:@"bundle"] ? YES : NO;
}

@end
