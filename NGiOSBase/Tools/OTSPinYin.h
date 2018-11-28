//
//  PadListProductPinYin.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTSPinYin : NSObject
/**
 *  获取首字母
 *
 *  @param fullString 原字符串
 *
 *  @return 首字母
 */
+ (NSString *)getFirstLetter:(NSString *)fullString;

/*
 
 汉子转拼音
 chinese ： 汉子字符串
 
 */
+ (NSString *)chineseConvertEnglish:(NSString *)chinese;
@end
