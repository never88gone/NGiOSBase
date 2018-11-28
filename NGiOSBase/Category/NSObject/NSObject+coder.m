//
//  NSObject+coder.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NSObject+coder.h"
#import "NSObject+runtime.h"

@interface NSObject () <NSCoding>

@end

@implementation NSObject (coder)

- (id)otsDecodeWithCoder:(NSCoder *)aDecoder
{
    [[self getProperties] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self setValue:[aDecoder decodeObjectForKey:obj] forKey:obj];
    }];
    return self;
}

- (void)otsEncodeWithCoder:(NSCoder *)aCoder
{
    [[self getProperties] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [aCoder encodeObject:[self valueForKey:obj] forKey:obj];
    }];
}


@end
