//
//  NGWeakObjectDeathNotifier.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGWeakObjectDeathNotifier.h"
#import "NSObject+category.h"

@interface NGWeakObjectDeathNotifier ()

@property (nonatomic, copy) NGWeakObjectDeathNotifierBlock aBlock;

@end

@implementation NGWeakObjectDeathNotifier

- (void)setBlock:(NGWeakObjectDeathNotifierBlock)block
{
    self.aBlock = block;
}

- (void)dealloc
{
    if (self.aBlock) {
        self.aBlock(self);
    }

    self.aBlock = nil;
}

- (void)setOwner:(id)owner
{
    _owner = owner;
    
    [owner objc_setAssociatedObject:[NSString stringWithFormat:@"observerOwner_%p",self] value:self policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}

@end
