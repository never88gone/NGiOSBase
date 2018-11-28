//
//  NSString+ConvertType.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ConvertType)

+(NSString *) unicodeToUtf8:(NSString *)string;
+(NSString *) utf8ToUnicode:(NSString *)string;
//"#fff303"色值转16进制
- (unsigned long)sixteenBinarySystem;

@end
