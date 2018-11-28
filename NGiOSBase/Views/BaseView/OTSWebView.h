//
//  OTSWebView.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTSWebView : UIWebView
/**
 *  设置cookie
 *
 *  @param aDomain
 *  @param aName
 *  @param aValue  
 */
+ (void)setCookie:(NSString *)aDomain name:(NSString *)aName value:(NSString *)aValue;
/**
 *  设置cookie
 *
 *  @param aName
 *  @param aValue
 */
+ (void)setCookieName:(NSString *)aName value:(NSString *)aValue;
/**
 *  清除cookies
 */
+ (void)clearCookies;

/**
 *  添加默认的cookies
 */
+ (void)setupDefaultCookies;

@end
