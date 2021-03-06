//
//  UIView+Plus.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Plus)

/**
 *  取消第一响应
 */
- (void)resignAllResonders;

/**
 *	功能:删除view的某种子视图
 *
 *	@param aClass :要被删除子视图类
 */
-(void)removeAllSubsWithClass:(Class)aClass;

/**
 *	功能:获取某种类型的子视图
 *
 *	@param aClass :子视图类型
 *
 *	@return 数组
 */
- (NSArray *)subViewsWithClass:(Class)aClass;

/**
 *	功能:在当前view里面现实laoding信息
 *
 *	@param aMessage :现实的信息内容
 */
- (void)showLoadingWithMessage:(NSString *)aMessage;

/**
 *	功能:隐藏当前view里面的loading信息
 */
- (void)hideLoading;

/**
 *  带标题居中toast
 */
- (void)showToastWithTitle:(NSString *)title titleFont:(UIFont *)titleFont message:(NSString *)message messageFont:(UIFont *)messageFont duration:(CGFloat)duration;
@end
