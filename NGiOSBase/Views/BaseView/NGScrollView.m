//
//  NGScrollView.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGScrollView.h"

#import "NGFuncDefine.h"

#import "NGWeakObjectDeathNotifier.h"

@implementation NGScrollView

- (void)setDelegate:(id<UIScrollViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    NGWeakObjectDeathNotifier *wo = [NGWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(NGWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
    }];
}

@end
