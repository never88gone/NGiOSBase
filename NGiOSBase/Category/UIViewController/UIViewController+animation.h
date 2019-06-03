//
//  UIViewController+animation.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGVCAnimation.h"

@interface UIViewController (NGAnimation)

//navigation
- (id<UIViewControllerAnimatedTransitioning>)pushAnimations;
- (id<UIViewControllerAnimatedTransitioning>)popAnimations;
- (id<UIViewControllerAnimatedTransitioning>)pushInteractions;
- (id<UIViewControllerAnimatedTransitioning>)popInteractions;

@end
