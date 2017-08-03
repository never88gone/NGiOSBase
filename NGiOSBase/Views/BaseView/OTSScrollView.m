//
//  OTSScrollView.m
//  OneStoreFramework
//
//  Created by huangjiming on 6/24/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
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
