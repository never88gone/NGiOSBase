//
//  UIView+Maker.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NGViewMaker.h"
#import "NGUILabelMaker.h"
#import "NGUIButtonMaker.h"
@interface UIView(Maker)

/**
 *  生成自动布局的视图.
 *  默认:
 *  self.frame = CGRctZero
 *  self.translatesAutoresizingMaskIntoConstraints = NO
 *
 *  @param block :可以设置NGViewMaker对象来简化赋值
 *
 *  @return 对象
 */
+ (instancetype)makeAutoLayoutView:(void(^)(NGViewMaker *maker))block;

/**
 *  生成自动布局的Label视图.可简化UILabel的赋值
 *  默认:
 *  self.frame = CGRctZero
 *  self.translatesAutoresizingMaskIntoConstraints = NO
 *  self.backgroundColor = [UIColor clearColor];
 *  self.fontSize = [UIFont systemFontSize];
 *  self.numberOfLines = 1;
 *
 *  @param block :可以设置NGUILabelMaker对象来简化赋值UILabel对象
 *
 *  @return 对象
 */

+ (instancetype)makeAutoLayoutLabel:(void(^)(NGUILabelMaker* labelMaker))block;

/**
 *  生成自动布局的UIButton视图.可简化UIButton的赋值
 *  默认:
 *  self.titleFontSize = [UIFont systemFontSize];
 *  self.titleColor = [UIColor whiteColor];
 *  self.frame = CGRctZero
 *  self.translatesAutoresizingMaskIntoConstraints = NO
 *  @param block :可以设置NGUIButtonMaker对象来简化赋值UIButton对象
 *
 *  @return 对象
 */

+ (instancetype)makeAutoLayoutButton:(void(^)(NGUIButtonMaker* buttonMaker))block;
@end
