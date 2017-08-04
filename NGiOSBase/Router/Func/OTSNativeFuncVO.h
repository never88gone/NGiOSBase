//
//  OTSNativeFuncVO.h
//  OneStoreFramework
//
//  Created by Aimy on 10/7/14.
//  Copyright (c) 2014 OneStore. All rights reserved.
//

#import <Foundation/Foundation.h>
//router
#import "OTSMappingVO.h"

typedef NS_ENUM(NSUInteger, OTSNativeFuncVOPlatformType)
{
    OTSNativeFuncVOPlatformTypePhone     = 0,//只在iPhone上加载此func
    OTSNativeFuncVOPlatformTypePad       = 1,//只在iPad上加载此func
    OTSNativeFuncVOPlatformTypeUniversal = 2,//任何平台都加载此func
};

typedef id (^OTSNativeFuncVOBlock)(NSDictionary *params);

@interface OTSNativeFuncVO : NSObject
/**
 *  调用的方法,默认传送一个参数，为NSDictionary
 */
@property (nonatomic, copy) OTSNativeFuncVOBlock block;
/**
 *  func过滤
 */
@property (nonatomic) OTSMappingClassPlatformType funcFilterType;
/**
 *  调用此方法需要先登陆
 */
@property (nonatomic) BOOL needLogin;

+ (instancetype)createWithBlock:(OTSNativeFuncVOBlock)block;

@end
