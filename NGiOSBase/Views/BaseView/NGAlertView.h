//
//  NGAlertView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NGAlertView;
/**
 *  alertview点击按钮之后的回调block
 *
 *  @param alertView   对象
 *  @param buttonIndex 点击的button的序号，从0开始
 */
typedef void(^NGAlertViewBlock)(NGAlertView *alertView, NSInteger buttonIndex);

@interface NGAlertView : UIAlertView

@property (nonatomic, copy) NGAlertViewBlock block;

@property (nonatomic, strong) id data;
/**
 *  弹框AlertView（默认有一个标题为确定的按钮）
 *
 *  @param aMessage 内容
 *  @param aBlock   回调block
 *
 *  @return NGAlertView
 */
+ (instancetype)alertWithMessage:(NSString *)aMessage andCompleteBlock:(NGAlertViewBlock)aBlock;
/**
 *  弹框AlertView（默认有一个标题为确定的按钮）
 *
 *  @param aTitle   标题
 *  @param aMessage 内容
 *  @param aBlock   回调block
 *
 *  @return NGAlertView
 */
+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage andCompleteBlock:(NGAlertViewBlock)aBlock;
/**
 *  弹框AlertView
 *
 *  @param aTitle       标题
 *  @param aMessage     内容
 *  @param leftBtnName  左按钮标题
 *  @param rightBtnName 右按钮标题
 *  @param aData        保存的数据
 *  @param aBlock       回调block
 *
 *  @return NGAlertView
 */
+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage leftBtn:(NSString *)leftBtnName rightBtn:(NSString *)rightBtnName extraData:(id)aData andCompleteBlock:(NGAlertViewBlock)aBlock;

@end
