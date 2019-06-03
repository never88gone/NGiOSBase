//
//  NGActionSheet.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NGActionSheet;
/**
 *  actionSheet点击按钮之后的回调block
 *
 *  @param actionSheet   对象
 *  @param buttonIndex 点击的button的序号，从0开始
 */
typedef void(^NGActionSheetBlock)(NGActionSheet *actionSheet, NSInteger buttonIndex);

@interface NGActionSheet : UIActionSheet

/**
 *  创建action sheet
 *
 *  @param aTitle                  标题
 *  @param aCancelButtonTitle      取消按钮
 *  @param aDestructiveButtonTitle 确定按钮
 *  @param aBlock                  回调block
 *
 *  @return actionSheet
 */
+ (instancetype)actionSheetWithTitle:(NSString *)aTitle cancelButtonTitle:(NSString *)aCancelButtonTitle destructiveButtonTitle:(NSString *)aDestructiveButtonTitle andCompleteBlock:(NGActionSheetBlock)aBlock;

@end
