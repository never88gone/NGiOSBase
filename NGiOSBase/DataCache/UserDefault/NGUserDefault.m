//
//  NGUserDefault.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGUserDefault.h"

@implementation NGUserDefault

+ (void)setValue:(id)anObject forKey:(NSString *)aKey
{
    if ( ! aKey || ! [aKey isKindOfClass:[NSString class]]) {
        return ;
    }
    
    if (anObject)
    {
        [[NSUserDefaults standardUserDefaults] setObject:anObject forKey:aKey];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:aKey];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getValueForKey:(NSString *)aKey
{
    if ( ! aKey || ! [aKey isKindOfClass:[NSString class]]) {
        return nil;
    }
    return [[NSUserDefaults standardUserDefaults] objectForKey:aKey];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)aKey {
    
    if ( ! aKey || ! [aKey isKindOfClass:[NSString class]]) {
        return ;
    }
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:aKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getBoolValueForKey:(NSString *)aKey {
    if ( ! aKey || ! [aKey isKindOfClass:[NSString class]]) {
        return false;
    }
    return [[NSUserDefaults standardUserDefaults] boolForKey:aKey];
}

@end
