//
//  OTSWebView.h
//  OneStoreFramework
//
//  Created by Aimy on 14-6-23.
//  Copyright (c) 2014年 OneStore. All rights reserved.
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
