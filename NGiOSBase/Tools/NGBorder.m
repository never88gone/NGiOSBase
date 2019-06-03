//
//  NGBorder.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGBorder.h"

#import "UIView+create.h"

@implementation NGBorder

+ (void)addBorderWithView:(UIView *)aView type:(NGBorderType)aType andColor:(UIColor *)aColor
{
    [self addBorderWithView:aView type:aType andColor:aColor andEdgeInset:UIEdgeInsetsZero];
}

+ (void)addBorderWithView:(UIView *)aView type:(NGBorderType)aType andColor:(UIColor *)aColor andEdgeInset:(UIEdgeInsets)aEdgeInset
{
    UIView *copyView = [UIView autolayoutView];
    copyView.backgroundColor = aColor;
    
    NSDictionary *insets = @{@"left": @(aEdgeInset.left), @"right": @(aEdgeInset.right), @"top": @(aEdgeInset.top), @"bottom": @(aEdgeInset.bottom)};
    
    CGFloat defaultBorderWidth = 1 / [UIScreen mainScreen].scale;
    
    if (aType & NGBorderTypeTop) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = NGBorderViewTypeTop;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]-(right)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.bottom]];
    }
    
    if (aType & NGBorderTypeLeft) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = NGBorderViewTypeLeft;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.right]];
    }
    
    if (aType & NGBorderTypeBottom) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = NGBorderViewTypeBottom;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(left)-[borderView]-(right)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.bottom]];
    }
    
    if (aType & NGBorderTypeRight) {
        UIView *borderView = [UIView duplicate:copyView];
        borderView.tag = NGBorderViewTypeRight;
        [aView addSubview:borderView];
        
        [aView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[borderView]-(bottom)-|" options:0 metrics:insets views:NSDictionaryOfVariableBindings(borderView)]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:aView attribute:NSLayoutAttributeRight multiplier:1.f constant:0.f]];
        [aView addConstraint:[NSLayoutConstraint constraintWithItem:borderView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.f constant:defaultBorderWidth + aEdgeInset.right]];
    }
}

+ (void)removeBorderWithView:(UIView *)aView type:(NGBorderType)aType
{
    if (aType & NGBorderTypeTop) {
        UIView *borderView = [aView viewWithTag:NGBorderViewTypeTop];
        [borderView removeFromSuperview];
    }
    
    if (aType & NGBorderTypeLeft) {
        UIView *borderView = [aView viewWithTag:NGBorderViewTypeLeft];
        [borderView removeFromSuperview];
    }
    
    if (aType & NGBorderTypeBottom) {
        UIView *borderView = [aView viewWithTag:NGBorderViewTypeBottom];
        [borderView removeFromSuperview];
    }
    
    if (aType & NGBorderTypeRight) {
        UIView *borderView = [aView viewWithTag:NGBorderViewTypeRight];
        [borderView removeFromSuperview];
    }
}

@end
