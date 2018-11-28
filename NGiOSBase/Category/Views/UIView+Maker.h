//
//  UIView+Maker.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OTSViewMaker.h"
#import "OTSUILabelMaker.h"
#import "OTSUIButtonMaker.h"
@interface UIView(Maker)

/**
 *  生成自动布局的视图.
 *  默认:
 *  self.frame = CGRctZero
 *  self.translatesAutoresizingMaskIntoConstraints = NO
 *
 *  @param block:可以设置OTSViewMaker对象来简化赋值
 *
 *  @return
 */
+ (instancetype)makeAutoLayoutView:(void(^)(OTSViewMaker *maker))block;

/**
 *  生成自动布局的Label视图.可简化UILabel的赋值
 *  默认:
 *  self.frame = CGRctZero
 *  self.translatesAutoresizingMaskIntoConstraints = NO
 *  self.backgroundColor = [UIColor clearColor];
 *  self.fontSize = [UIFont systemFontSize];
 *  self.numberOfLines = 1;
 *
 *  @param block:可以设置OTSUILabelMaker对象来简化赋值UILabel对象
 *
 *  @return
 */

+ (instancetype)makeAutoLayoutLabel:(void(^)(OTSUILabelMaker* labelMaker))block;

/**
 *  生成自动布局的UIButton视图.可简化UIButton的赋值
 *  默认:
 *  self.titleFontSize = [UIFont systemFontSize];
 *  self.titleColor = [UIColor whiteColor];
 *  self.frame = CGRctZero
 *  self.translatesAutoresizingMaskIntoConstraints = NO
 *  @param block:可以设置OTSUIButtonMaker对象来简化赋值UIButton对象
 *
 *  @return
 */

+ (instancetype)makeAutoLayoutButton:(void(^)(OTSUIButtonMaker* buttonMaker))block;
@end
