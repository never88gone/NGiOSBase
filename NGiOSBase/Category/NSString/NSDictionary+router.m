//
//  NSDictionary+router.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NSDictionary+router.h"

@implementation NSDictionary (router)

- (id)objectForCaseInsensitiveKey:(NSString *)aKey
{
    if (!aKey) {
        return nil;
    }
    
    __block id returnObj = nil;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSString *tempKey = key;
        if ([tempKey compare:aKey options:NSCaseInsensitiveSearch] == NSOrderedSame) {
            returnObj = obj;
            *stop = YES;
        }
    }];
    
    return returnObj;
}

@end
