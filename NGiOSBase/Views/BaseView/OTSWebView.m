//
//  OTSWebView.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSWebView.h"

#import "OTSFuncDefine.h"

//category
#import "NSString+plus.h"
#import "NSObject+JsonToVO.h"
#import "NSObject+BeeNotification.h"

//global
#import "OTSGlobalValue.h"
#import "OTSClientInfo.h"

#import "OTSJsonKit.h"
#import "OTSWeakObjectDeathNotifier.h"

@implementation OTSWebView

#pragma mark - cookies
+ (void)setCookie:(NSString *)aDomain name:(NSString *)aName value:(NSString *)aValue
{
    if (!aName) {
        return ;
    }
    
    if (!aValue) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies.copy enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSHTTPCookie *cookie = obj;
            if ([cookie.properties[NSHTTPCookieName] isEqualToString:aName]) {
                [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:obj];
                *stop = YES;
            }
        }];
        return ;
    }
    
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    cookieProperties[NSHTTPCookieDomain] = aDomain;
    cookieProperties[NSHTTPCookieName] = aName;
    cookieProperties[NSHTTPCookieValue] = aValue;
    cookieProperties[NSHTTPCookiePath] = @"/";
    cookieProperties[NSHTTPCookieVersion] = @"0";
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}

+ (void)setCookieName:(NSString *)aName value:(NSString *)aValue
{
    [self setCookie:@".yhd.com" name:aName value:aValue];
}

+ (void)setupDefaultCookies
{
    /**
     *  token
     */
    [OTSWebView setCookieName:@"usertoken" value:[OTSGlobalValue sharedInstance].token];


    /**
     *  sessionid
     */
    [OTSWebView setCookieName:@"sessionid" value:[OTSGlobalValue sharedInstance].sessionId];
    /**
     *  clientinfo
     */
    [OTSWebView setCookieName:@"clientinfo" value:[OTSJsonKit stringFromDict:[[OTSClientInfo sharedInstance] convertDictionary]].urlEncodingAllCharacter];
    /**
     *  frameworkver
     */
    [OTSWebView setCookieName:@"frameworkver" value:@"1.0"];
    /**
     *  platform
     */
    [OTSWebView setCookieName:@"platform" value:@"ios"];
    /**
     *  ut
     */
    [OTSWebView setCookieName:@"ut" value:[OTSGlobalValue sharedInstance].token];
    /**
     *  guid
     */
    [OTSWebView setCookieName:@"guid" value:[OTSClientInfo sharedInstance].deviceCode];
}

+ (void)clearCookies
{
    [[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies.copy enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:obj];
    }];
}

- (void)dealloc
{
    self.delegate = nil;
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id<UIWebViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    OTSWeakObjectDeathNotifier *wo = [OTSWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(OTSWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
    }];
}

@end
