//
//  OTSActivityTracing.h
//  OneStoreFramework
//
//  Created by Aimy on 3/24/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import <Foundation/Foundation.h>
//define
#import "OTSFuncDefine.h"

@interface OTSActivityTracing : NSObject

AS_SINGLETON(OTSActivityTracing)

/**
 *  往bug线程上设置当前显示的界面
 *
 */
- (void)setCurrentRunningIdentifier:(NSString *)name;

/**
 *  模拟一个crash
 */
+ (void)crash;

@end
