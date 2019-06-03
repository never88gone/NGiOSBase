//
//  NGSize.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGSize.h"

#import "NGFuncDefine.h"
#import "NGLog.h"

@implementation NGSize

+ (CGFloat)getLengthWithSizeType:(NGSizeType)sizeType andLength:(CGFloat)length
{
    CGFloat resultLength = length * [[self multiplicative][@([self getCurrentSizeType])] doubleValue] / [[self multiplicative][@(sizeType)] doubleValue];
    resultLength = ceil(resultLength);
    
    return resultLength;
}

+ (CGFloat)getRatioLengthWithSizeType:(NGSizeType)sizeType andLength:(CGFloat)length
{
    CGFloat resultLength = length * [[self multiplicative][@([self getCurrentRatioSizeType])] doubleValue] / [[self multiplicative][@(sizeType)] doubleValue];
    resultLength = ceil(resultLength);
    
    return resultLength;
}

+ (NGSizeType)getCurrentRatioSizeType
{
    static NGSizeType currentRatioSizeType = NGSizeTypeNone;
    
    if (ISIPHONE3_5) {
        currentRatioSizeType = NGSizeType3_5;
    }
    else if (ISIPHONE4_0) {
        currentRatioSizeType = NGSizeType4_0;
    }
    else if (ISIPHONE4_7) {
        currentRatioSizeType = NGSizeType4_7;
    }
    else if (ISIPHONE5_5) {
        currentRatioSizeType = NGSizeType5_5;
    }
    else if (ISIPHONE9_7) {
        currentRatioSizeType = NGSizeType9_7;
    }
    else if(ISIPHONE9_7_LAND){
        currentRatioSizeType = NGSizeType9_7_LAND;
    }
    
    return currentRatioSizeType;
}

+ (NGSizeType)getCurrentSizeType
{
    static NGSizeType currentSizeType = NGSizeTypeNone;
    
    if (currentSizeType == NGSizeTypeNone) {
        if (ISIPHONE3_5) {
            currentSizeType = NGSizeType3_5;
        }
        else if (ISIPHONE4_0) {
            currentSizeType = NGSizeType4_0;
        }
        else if (ISIPHONE4_7) {
            currentSizeType = NGSizeType4_7;
        }
        else if (ISIPHONE5_5) {
            currentSizeType = NGSizeType5_5;
        }
        else if (ISIPHONE9_7) {
            currentSizeType = NGSizeType9_7;
        }
        else if(ISIPHONE9_7_LAND){
            currentSizeType = NGSizeType9_7;
        }
    }
    
    return currentSizeType;
}

+ (NSDictionary *)multiplicative
{
    return @{@0:@0,
             @1:@320,
             @2:@320,
             @3:@375,
             @4:@414,
             @5:@768,
             @6:@1024};
}

@end
