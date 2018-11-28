//
//  OTSFont.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSFont.h"

#import "OTSFuncDefine.h"

@implementation OTSFont

+ (UIFont *)otsNumberFontOfSize:(CGFloat)fontSize
{
    return [self fontWithName:@"Futura" size:fontSize];
}

+ (UIFont *)small
{
    CGFloat fontSize = 10;
    if (IS_IPAD_DEVICE) {
        fontSize = 12;
    }
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)medium
{
    CGFloat fontSize = 12;
    if (IS_IPAD_DEVICE) {
        fontSize = 14;
    }
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)large
{
    CGFloat fontSize = 14;
    if (IS_IPAD_DEVICE) {
        fontSize = 16;
    }
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)bigLarge
{
    CGFloat fontSize = 18;
    if (IS_IPAD_DEVICE) {
        fontSize = 20;
    }
    return [UIFont systemFontOfSize:fontSize];
}
@end
