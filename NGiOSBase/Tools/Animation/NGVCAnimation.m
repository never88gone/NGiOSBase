//
//  NGVCAnimation.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGVCAnimation.h"

@interface NGVCAnimation ()

@property (nonatomic) BOOL push;

@end

@implementation NGVCAnimation

+ (instancetype)animationWithType:(BOOL)push
{
    NGVCAnimation *animations = [self new];
    animations.push = push;
    return animations;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return .34f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    
    UIView *containerView = [transitionContext containerView];
    float deviation = (self.isPush) ? 1.0f : -1.0f;
    
    CGRect newFrame = finalFrame;
    newFrame.origin.x += newFrame.size.width * deviation;
    toViewController.view.frame = newFrame;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:fromViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toViewController.view.frame = finalFrame;
        
        CGRect animationFrame = fromViewController.view.frame;
        animationFrame.origin.x -= animationFrame.size.width * deviation;
        fromViewController.view.frame = animationFrame;
        
    } completion:^(BOOL finished) {
        [toViewController.tabBarController.view setNeedsLayout];//tbc的bug，所以得重新刷新界面，不然tabbar会有问题
        [transitionContext completeTransition: ! [transitionContext transitionWasCancelled]];
    }];
}

@end
