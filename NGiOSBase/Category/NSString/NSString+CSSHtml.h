//
//  NSString+CSSHtml.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CSSHtml)

/**
 *  给html添加一个居中显示的css样式,返回此html
 *
 *  @return 字符串
 */
- (NSString *)getAlignCenterCssHtml;

- (NSString *)getWirelessAlignCenterCssHtml;

- (NSString *)getPCAlignCenterCssHtml;

- (NSString *)getTheOtherOneAlignCenterCssHtml;

@end
