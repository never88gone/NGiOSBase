//
//  NGCoreGraphicHelper.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>

//use CTStringAttributes.h instead NSAttributedString.h

//背景色
extern const NSString *kNGBackgroundColorAttributeName;
//背景色区域与字区域的便宜，相当于大了多少
extern const NSString *kNGBackgroundOffsetAttributeName;
//背景色区域高度
extern const NSString *kNGBackgroundHeightbuteName;
//圆角类型
extern const NSString *kNGBackgroundCornerTypeAttributeName;
//圆角大小
extern const NSString *kNGBackgroundCornerRadiusAttributeName;

//框的宽度
extern const NSString *kNGBorderWidthAttributeName;
//背景色区域与字区域的便宜，相当于大了多少
extern const NSString *kNGBorderOffsetAttributeName;
//框的颜色
extern const NSString *kNGBorderColorAttributeName;
//框的圆角大小
extern const NSString *kNGBorderCornerRadiusAttributeName;

//占位大小
extern const NSString *kNGPlaceholderRectAttributeName;
//占位图片
extern const NSString *kNGPlaceholderImageAttributeName;

//typedef void (^NGCoreGraphicHelperRunBlock)(CTFrameRef, CTLineRef, CFIndex, CTRunRef, CFIndex);

@interface NGCoreGraphicHelper : NSObject

/**
 *  画string
 *
 *  @param attributedString 富文本
 *  @param drawRect         幕布rect
 *  @param textRect         文件rect
 *  @param c                context
 */
+ (void)drawAttributedString:(NSAttributedString *)attributedString inDrawRect:(CGRect)drawRect inTextRect:(CGRect)textRect context:(CGContextRef)c;

@end

@interface NSMutableAttributedString (NGCoreGraphicHelper)

/**
 *  添加图文混排占位字符
 *
 *  @param rect      图片rect
 *  @param imageName 图片
 *
 *  @return self
 */
- (NSMutableAttributedString *)stringByAppendingPlaceholerRect:(CGRect)rect placeholderImageName:(NSString *)imageName;
/**
 *  添加图文混排占位字符
 *
 *  @param rect      图片rect
 *  @param imageName 图片
 *  @param attributes 添加属性
 *
 *  @return self
 */
- (NSMutableAttributedString *)stringByAppendingPlaceholerRect:(CGRect)rect placeholderImageName:(NSString *)imageName attributes:(NSDictionary *)attributes;

@end
