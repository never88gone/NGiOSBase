//
//  NGGlobalValue.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGGlobalValue.h"
//category
#import "NSObject+JsonToVO.h"
#import "NSNumber+safe.h"
//tool
#import "NGJsonKit.h"
//cache
#import "NGKeychain.h"
#import "NGUserDefault.h"

@interface NGGlobalValue()


@end

@implementation NGGlobalValue


DEF_SINGLETON(NGGlobalValue)

- (instancetype)init
{
    if (self = [super init]) {

    }
    return self;
}




@end
