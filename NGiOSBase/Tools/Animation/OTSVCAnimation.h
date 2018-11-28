//
//  OTSVCAnimation.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTSVCAnimation : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, readonly, getter=isPush) BOOL push;

+ (instancetype)animationWithType:(BOOL)push;

@end
