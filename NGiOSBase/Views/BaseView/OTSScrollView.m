//
//  OTSScrollView.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSScrollView.h"

#import "OTSFuncDefine.h"

#import "OTSWeakObjectDeathNotifier.h"

@implementation OTSScrollView

- (void)setDelegate:(id<UIScrollViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    OTSWeakObjectDeathNotifier *wo = [OTSWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(OTSWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
    }];
}

@end
