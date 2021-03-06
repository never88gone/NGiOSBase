//
//  NGKeychain.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//


@interface NGKeychain : NSObject

/**
 *  只能set基本数据类型,NSNumber,NSString,NSData,NSDate等,不能set继承的Class
 *
 *  @param value value
 *  @param type 类型
 */
+ (void)setKeychainValue:(id<NSCopying, NSObject>)value forType:(NSString *)type;
+ (id)getKeychainValueForType:(NSString *)type;
+ (void)reset;

@end
