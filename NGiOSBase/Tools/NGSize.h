//
//  NGSize.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NGFuncDefine.h"

typedef enum NGSizeType
{
    NGSizeTypeNone = 0,
    NGSizeType3_5,
    NGSizeType4_0,
    NGSizeType4_7,
    NGSizeType5_5,
    NGSizeType9_7,
    NGSizeType9_7_LAND,
} NGSizeType;

#define NGScaledLength(lengthValue) [NGSize getLengthWithSizeType:NGSizeType4_7 andLength:(lengthValue)]

@interface NGSize : NSObject

+ (CGFloat)getLengthWithSizeType:(NGSizeType)sizeType andLength:(CGFloat)length;

+ (CGFloat)getRatioLengthWithSizeType:(NGSizeType)sizeType andLength:(CGFloat)length;

@end

#define NG_RATIO_LENGTH(length) IS_IPHONE_DEVICE ? NG_PHONE_RATIO_LENGTH(length) : NG_PAD_RATIO_LENGTH(length)
#define NG_PHONE_RATIO_LENGTH(length) [NGSize getLengthWithSizeType:NGSizeType4_7 andLength:length]
#define NG_PAD_RATIO_LENGTH(length) [NGSize getLengthWithSizeType:NGSizeType9_7 andLength:length]
