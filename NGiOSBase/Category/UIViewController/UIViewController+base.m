//
//  UIViewController+base.m
//  OneStoreBase
//
//  Created by huangjiming on 11/9/15.
//  Copyright © 2015 OneStoreBase. All rights reserved.
//

#import "UIViewController+base.h"
//tool
#import "OTSLog.h"
#import "OTSWeakObjectDeathNotifier.h"
//controllers
#import "OTSContainerController.h"
//category
#import "NSObject+category.h"

@implementation UIViewController (base)

#pragma mark - Property
- (void)setContainerVC:(OTSContainerController *)containerVC
{
    OTSWeakObjectDeathNotifier *dn = [OTSWeakObjectDeathNotifier new];
    dn.owner = containerVC;
    [self objc_setAssociatedObject:@"container" value:dn policy:OBJC_ASSOCIATION_RETAIN];
}

- (OTSContainerController *)containerVC
{
    OTSWeakObjectDeathNotifier *dn = [self objc_getAssociatedObject:@"container"];
    OTSContainerController *container = dn.owner;
    if (!container) {
        container = self.navigationController.containerVC;
    }
    return container;
}

#pragma mark - API
//添加到rootvc
- (void)addToRootVC
{
    OTSLogFuncW;
}

//添加到containerVC
- (void)addToContainerVC:(UIViewController *)aContainerVC
{
    OTSLogFuncW;
}

//呈现动画
- (void)presentViewControllerAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    OTSLogFuncW;
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
