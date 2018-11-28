//
//  NSObject+coder.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (coder)
/**
 *  快捷从归档恢复方法
 *
 *  @param aDecoder
 *
 *  @return
 */
- (id)otsDecodeWithCoder:(NSCoder *)aDecoder;
/**
 *  快捷归档方法
 *
 *  @param aCoder 
 */
- (void)otsEncodeWithCoder:(NSCoder *)aCoder;

@end
