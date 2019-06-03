//
//  OTSGlobalValue.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSGlobalValue.h"
//category
#import "NSObject+JsonToVO.h"
#import "NSNumber+safe.h"
//tool
#import "OTSJsonKit.h"
//cache
#import "OTSKeychain.h"
#import "OTSUserDefault.h"

@interface OTSGlobalValue()


@end

@implementation OTSGlobalValue


DEF_SINGLETON(OTSGlobalValue)

- (instancetype)init
{
    if (self = [super init]) {

    }
    return self;
}




@end
