//
//  NSObject+coder.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (coder)
/**
 *  快捷从归档恢复方法
 *
 *  @param aDecoder aDecoder
 *
 *  @return id
 */
- (id)NGDecodeWithCoder:(NSCoder *)aDecoder;
/**
 *  快捷归档方法
 *
 *  @param aCoder  aDecoder
 */
- (void)NGEncodeWithCoder:(NSCoder *)aCoder;

@end
