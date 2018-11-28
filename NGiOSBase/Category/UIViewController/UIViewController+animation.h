//
//  UIViewController+animation.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSVCAnimation.h"

@interface UIViewController (OTSAnimation)

//navigation
- (id<UIViewControllerAnimatedTransitioning>)pushAnimations;
- (id<UIViewControllerAnimatedTransitioning>)popAnimations;
- (id<UIViewControllerAnimatedTransitioning>)pushInteractions;
- (id<UIViewControllerAnimatedTransitioning>)popInteractions;

@end
