//
//  OTSNativeFuncVO.m
//  OneStoreFramework
//
//  Created by Aimy on 10/7/14.
//  Copyright (c) 2014 OneStore. All rights reserved.
//

#import "OTSNativeFuncVO.h"

@implementation OTSNativeFuncVO

+ (instancetype)createWithBlock:(OTSNativeFuncVOBlock)block
{
    OTSNativeFuncVO *vo = [self new];
    vo.block = block;
    return vo;
}

@end
