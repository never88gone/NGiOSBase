//
//  NGFont.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGFont : UIFont

+ (UIFont *)NGNumberFontOfSize:(CGFloat)fontSize;

/**
 * 小号字体
 * iPhone:10,ipad:12
 *
 *  @return
 */
+ (UIFont *)small;

/**
 *  中号字体
 * iPhone:12,ipad:14
 *  @return
 */
+ (UIFont *)medium;

/**
 *  大号字体
 * iPhone:14,ipad:16
 *  @return
 */
+ (UIFont *)large;

/**
 *  超大号字体
 * iPhone:18,ipad:20
 *  @return
 */
+ (UIFont *)bigLarge;
@end
