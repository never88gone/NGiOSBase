//
//  OTSPresentController.h
//  OneStorePad
//
//  Created by Aimy on 3/23/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import <Foundation/Foundation.h>

//controller
#import "OTSContainerController.h"

@class OTSPresentController;

@protocol OTSPresentControllerDelegate <NSObject>

@optional
//是否能够点击空白区域，dismiss当前呈现的界面
- (BOOL)shouldDismissPresentationController:(OTSPresentController *)aPresentationController;
//将要呈现
- (void)willPresentPC:(OTSPresentController *)aPresentationController;
//已经呈现
- (void)didPresentPC:(OTSPresentController *)aPresentationController;
//将要消失
- (void)willDismissPC:(OTSPresentController *)aPresentationController;
//已经消失
- (void)didDismissPC:(OTSPresentController *)aPresentationController;

@end

@interface OTSPresentController : OTSContainerController

//代理
@property (nonatomic, weak) id<OTSPresentControllerDelegate> pcDelegate;
//动画持续时间
@property (nonatomic) NSTimeInterval duration;
//背景view
@property (nonatomic, strong, readonly) UIView *dimmingView;
//设置背景view的位置
@property (assign, nonatomic) UIEdgeInsets dimmingEdge;

@property (nonatomic, assign) BOOL forceDismissed;

/**
 *  做动画的VC
 */
@property (nonatomic, strong) UIViewController *animationVC;
/**
 *  做动画的view
 */
@property (nonatomic, strong) UIView *animationView;

@end
