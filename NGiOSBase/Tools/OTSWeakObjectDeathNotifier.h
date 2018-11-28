//
//  OTSWeakObjectDeathNotifier.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
//当owner释放的时候通知block
@class OTSWeakObjectDeathNotifier;

typedef void(^OTSWeakObjectDeathNotifierBlock)(OTSWeakObjectDeathNotifier *sender);

@interface OTSWeakObjectDeathNotifier : NSObject

@property (nonatomic, weak) id owner;
@property (nonatomic, strong) id data;

- (void)setBlock:(OTSWeakObjectDeathNotifierBlock)block;

@end
