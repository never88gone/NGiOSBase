//
//  NSObject+safe.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (safe)

/**
 *  转换成nsstring－》nsnumber
 *
 *  @return NSnumber
 */
- (NSNumber *)toNumberIfNeeded;

@end

@interface UIView (safe)

@end
