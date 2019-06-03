//
//  NGUILabelMaker.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGViewMaker.h"

@interface NGUILabelMaker : NGViewMaker

@property(nonatomic, strong)UIColor *textColor;

/**
 *  UILabel的字体大小,默认的是[UIFont systemFontSize]
 */
@property(nonatomic, assign)CGFloat fontSize;

/**
 *  UILabel的行数，0表示支持多行，默认是1行
 */
@property(nonatomic) NSInteger numberOfLines;

@end
