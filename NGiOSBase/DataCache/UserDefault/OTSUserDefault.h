//
//  OTSUserDefault.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSUserDefaultDefine.h"

@interface OTSUserDefault : NSObject

/**
 *  存储数据到userdefault
 *
 *  @param anObject 数据
 *  @param aKey     标识
 */
+ (void)setValue:(id)anObject forKey:(NSString *)aKey;
/**
 *  从userdefault获取数据
 *
 *  @param aKey 标识
 *
 *  @return 数据
 */
+ (id)getValueForKey:(NSString *)aKey;

/**
 *  存储 bool 值
 *
 *  @param value 数据
 *  @param aKey  key
 */
+ (void)setBool:(BOOL)value forKey:(NSString *)aKey;

/**
 *  从userdefault获取数据
 *
 *  @param aKey key
 *
 *  @return
 */
+ (BOOL)getBoolValueForKey:(NSString *)aKey;

@end
