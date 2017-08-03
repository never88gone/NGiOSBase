//
//  OTSDeepLink.h
//  OneStoreCommon
//
//  Created by hanxiaozhu on 15/11/16.
//  Copyright © 2015年 OneStoreCommon. All rights reserved.
//

#import <Foundation/Foundation.h>


//平台相关判断
typedef NS_ENUM(NSInteger, OTSRouteType) {
    OTSRouteTypeNone = 0,
    OTSRouteTypeDeepLink= 1,
};

@interface OTSDeepLink : NSObject

/**
 *  检测是否需要deeplink处理
 *
 *  @return 处理结果，YES表示成功，NO表示失败
 */
+ (BOOL) checkDeepLink;


/**
 *  处理应用拉起协议
 *  url 处理其他应用调用的逻辑
 *  处理结果，YES表示成功，NO表示失败
 */
+ (BOOL)handleOpenURL:(NSURL *)url;

/**
 * 是否可以处理应用拉起协议
 * url 处理其他应用调用的逻辑
 *  处理结果，YES表示可以 NO表示不行
 */
+ (BOOL)canHandleOpenURL:(NSURL *)url;

@end
