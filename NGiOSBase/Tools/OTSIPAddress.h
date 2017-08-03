//
//  OTSIPAddress.h
//  OneStoreBase
//
//  Created by Eason Qian on 15/12/4.
//  Copyright © 2015年 OneStoreBase. All rights reserved.
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
