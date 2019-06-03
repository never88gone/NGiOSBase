//
//  NGBorder.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NGBorderType) {
    NGBorderTypeNone      = 0,
    NGBorderTypeTop    = 1 << 0,
    NGBorderTypeLeft   = 1 << 1,
    NGBorderTypeBottom = 1 << 2,
    NGBorderTypeRight  = 1 << 3,
    NGBorderTypeAll    = NGBorderTypeTop | NGBorderTypeLeft | NGBorderTypeBottom | NGBorderTypeRight
};

typedef NS_ENUM(NSInteger, NGBorderViewType) {
    NGBorderViewTypeTop    = 10086,
    NGBorderViewTypeLeft,
    NGBorderViewTypeBottom,
    NGBorderViewTypeRight,
};

@interface NGBorder : NSObject

/**
 *  为view添加边线
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 */
+ (void)addBorderWithView:(UIView *)aView type:(NGBorderType)aType andColor:(UIColor *)aColor;

/**
 *  为view添加边线，可以设置缩进
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 *  @param aEdgeInset 缩进
 */
+ (void)addBorderWithView:(UIView *)aView type:(NGBorderType)aType andColor:(UIColor *)aColor andEdgeInset:(UIEdgeInsets)aEdgeInset;

/**
 *  删除border
 *
 *  @param aView view
 *  @param aType 边线类型，可以累计
 */
+ (void)removeBorderWithView:(UIView *)aView type:(NGBorderType)aType;

@end
