//
//  UIViewController+base.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UIViewController+base.h"
//tool
#import "NGLog.h"
#import "NGWeakObjectDeathNotifier.h"
//category
#import "NSObject+category.h"

@implementation UIViewController (base)

#pragma mark - Property

#pragma mark - API
//添加到rootvc
- (void)addToRootVC
{
    NGLogFuncW;
}

//添加到containerVC
- (void)addToContainerVC:(UIViewController *)aContainerVC
{
    NGLogFuncW;
}

//呈现动画
- (void)presentViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    NGLogFuncW;
}

//是否共享屏幕，默认为NO，代表如果有新的pc被router调用展现，则会取消之前显示的pc，然后展现此pc（目前应该只有登录界面会为YES）
- (BOOL)shouldShareScreen
{
    return NO;
}
/**
 *  能否被pc present出来
 *  默认是YES
 *  pc展示此vc时,如果已有同样的类型的vc在展示,用此变量来控制当前vc是否展示
 *
 *  @return
 */
- (BOOL)isPresented{
    return YES;
}
//是否是pc
- (BOOL)isPc
{
    return NO;
}

@end
