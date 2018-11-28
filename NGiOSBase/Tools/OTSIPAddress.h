//
//  OTSIPAddress.h
//  OneStoreBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTSFuncDefine.h"

@interface OTSIPAddress : NSObject

AS_SINGLETON(OTSIPAddress);

/**
 *  功能:获取IP地址
 */
- (NSString *)getIPAddress;
/**
 *  功能:获取mac地址
 */
- (NSString *)getHWAddress;

@end
