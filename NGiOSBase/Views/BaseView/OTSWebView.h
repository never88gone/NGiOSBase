//
//  OTSWebView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTSWebView : UIWebView
/**
 *  设置cookie
 *
 *  @param aDomain 域名
 *  @param aName  健
 *  @param aValue   值
 */
+ (void)setCookie:(NSString *)aDomain name:(NSString *)aName value:(NSString *)aValue;

/**
 *  清除cookies
 */
+ (void)clearCookies;

@end
