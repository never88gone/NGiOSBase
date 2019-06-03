//
//  NGWeakObjectDeathNotifier.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
//当owner释放的时候通知block
@class NGWeakObjectDeathNotifier;

typedef void(^NGWeakObjectDeathNotifierBlock)(NGWeakObjectDeathNotifier *sender);

@interface NGWeakObjectDeathNotifier : NSObject

@property (nonatomic, weak) id owner;
@property (nonatomic, strong) id data;

- (void)setBlock:(NGWeakObjectDeathNotifierBlock)block;

@end
