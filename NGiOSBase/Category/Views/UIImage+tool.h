//
//  UIImage+tool.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (tool)

/**
 *  通过颜色创建image
 *
 *  @param aColor 颜色
 *
 *  @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor;


+ (UIImage *)imageWithColor:(UIColor *)aColor cornerRadius:(float)cornerRadius;

/**
 *  视图转换为UIImage
 *
 *  @param view view
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithView:(UIView *)view;

+ (UIImage *)image:(UIImage *)image WithTintColor:(UIColor *)tintColor;

//设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

/**
 *  等比例缩放
 *
 *  @param size 大小
 *
 *  @return image
 */
-(UIImage*)scaleToSize:(CGSize)size;

/**
 *	按照尺寸缩放图片
 *
 *	@param aSize size
 *
 *	@return UIImage
 */
- (UIImage *)shrinkImageForSize:(CGSize)aSize;

/**
 *	功能:存储图片到doc目录
 *
 *	@param imageName :图片名称
 *	@param aQuality  :压缩比率
 *
 *	@return  NSString
 */
- (NSString *)saveImageWithName:(NSString *)imageName
		  forCompressionQuality:(CGFloat )aQuality;

@end
