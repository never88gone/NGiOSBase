//
//  UIViewController+animation.h
//  OneStoreFramework
//
//  Created by Aimy on 14-7-30.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSVCAnimation.h"

@interface UIViewController (OTSAnimation)

//navigation
- (id<UIViewControllerAnimatedTransitioning>)pushAnimations;
- (id<UIViewControllerAnimatedTransitioning>)popAnimations;
- (id<UIViewControllerAnimatedTransitioning>)pushInteractions;
- (id<UIViewControllerAnimatedTransitioning>)popInteractions;

@end
