//
//  OTSCoreGraphicHelper.h
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
extern const NSString *kOTSBackgroundColorAttributeName;
//背景色区域与字区域的便宜，相当于大了多少
extern const NSString *kOTSBackgroundOffsetAttributeName;
//背景色区域高度
extern const NSString *kOTSBackgroundHeightbuteName;
//圆角类型
extern const NSString *kOTSBackgroundCornerTypeAttributeName;
//圆角大小
extern const NSString *kOTSBackgroundCornerRadiusAttributeName;

//框的宽度
extern const NSString *kOTSBorderWidthAttributeName;
//背景色区域与字区域的便宜，相当于大了多少
extern const NSString *kOTSBorderOffsetAttributeName;
//框的颜色
extern const NSString *kOTSBorderColorAttributeName;
//框的圆角大小
extern const NSString *kOTSBorderCornerRadiusAttributeName;

//占位大小
extern const NSString *kOTSPlaceholderRectAttributeName;
//占位图片
extern const NSString *kOTSPlaceholderImageAttributeName;

//typedef void (^OTSCoreGraphicHelperRunBlock)(CTFrameRef, CTLineRef, CFIndex, CTRunRef, CFIndex);

@interface OTSCoreGraphicHelper : NSObject

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

@interface NSMutableAttributedString (OTSCoreGraphicHelper)

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
