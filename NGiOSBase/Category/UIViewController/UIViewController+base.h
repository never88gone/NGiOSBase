//
//  UIViewController+base.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NGContainerController;

@interface UIViewController (base)

//添加到rootvc
- (void)addToRootVC;
//添加到containerVC
- (void)addToContainerVC:(UIViewController *)aContainerVC;
//呈现动画
- (void)presentViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion;
//是否共享屏幕，默认为NO，代表如果有新的pc被router调用展现，则会取消之前显示的pc，然后展现此pc（目前应该只有登录界面会为YES）
- (BOOL)shouldShareScreen;
//是否是pc
- (BOOL)isPc;
/**
 *  能否被pc present出来
 *  默认是YES
 *  pc展示此vc时,如果已有同样的类型的vc在展示,用此变量来控制当前vc是否展示
 *
 *  @return 是否成功
 */
- (BOOL)isPresented;
@end
