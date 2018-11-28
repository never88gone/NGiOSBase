//
//  OTSBorder.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OTSBorderType) {
    OTSBorderTypeNone      = 0,
    OTSBorderTypeTop    = 1 << 0,
    OTSBorderTypeLeft   = 1 << 1,
    OTSBorderTypeBottom = 1 << 2,
    OTSBorderTypeRight  = 1 << 3,
    OTSBorderTypeAll    = OTSBorderTypeTop | OTSBorderTypeLeft | OTSBorderTypeBottom | OTSBorderTypeRight
};

typedef NS_ENUM(NSInteger, OTSBorderViewType) {
    OTSBorderViewTypeTop    = 10086,
    OTSBorderViewTypeLeft,
    OTSBorderViewTypeBottom,
    OTSBorderViewTypeRight,
};

@interface OTSBorder : NSObject

/**
 *  为view添加边线
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 */
+ (void)addBorderWithView:(UIView *)aView type:(OTSBorderType)aType andColor:(UIColor *)aColor;

/**
 *  为view添加边线，可以设置缩进
 *
 *  @param aView  view
 *  @param aType  边线类型，可以累计
 *  @param aColor 颜色
 *  @param aEdgeInset 缩进
 */
+ (void)addBorderWithView:(UIView *)aView type:(OTSBorderType)aType andColor:(UIColor *)aColor andEdgeInset:(UIEdgeInsets)aEdgeInset;

/**
 *  删除border
 *
 *  @param aView view
 *  @param aType 边线类型，可以累计
 */
+ (void)removeBorderWithView:(UIView *)aView type:(OTSBorderType)aType;

@end
