//
//  OTSDeepLink.m
//  OneStoreCommon
//
//  Created by hanxiaozhu on 15/11/16.
//  Copyright © 2015年 OneStoreCommon. All rights reserved.
//

#import "OTSDeepLink.h"
#import <UIKit/UIKit.h>
#import <BlocksKit/BlocksKit+UIKit.h>

#import "OTSJsonKit.h"

#import "OTSRouter.h"

#import "OTSAlertView.h"
//category
#import "NSArray+safe.h"
#import "NSMutableDictionary+safe.h"

static NSString     *appId;
static NSString     *sdkVersion;
static NSString     *sourceAppBundleId;
static NSString     *sourceAppName;
static OTSRouteType routeType; // deep link 类型

@interface OTSDeepLink ()
@end

@implementation OTSDeepLink

+ (BOOL)checkDeepLink
{
    if (routeType != OTSRouteTypeNone) {
        
        NSString *str =  [NSString stringWithFormat:@"返回 %@",sourceAppName];
        [OTSAlertView alertWithTitle:@"跳转提示" message:nil leftBtn:@"留在 1号店" rightBtn:str extraData:nil andCompleteBlock:^(OTSAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                NSString *url = [NSString stringWithFormat:@"%@://", appId];
                
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
                }
            }
            routeType = OTSRouteTypeNone;
        }];
        
        return YES;
    }
    return NO;
}


+ (BOOL)handleOpenURL:(NSURL *)url
{
    NSString *queryStr = [url.query stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSArray  *paramStrs = [queryStr componentsSeparatedByString:@"&"];
    NSMutableDictionary *paramsDict = [@{} mutableCopy];

    for (NSString *subParamStr in paramStrs) {
        NSArray *subParamStrs = [subParamStr componentsSeparatedByString:@"="];
        NSString *key = [subParamStrs safeObjectAtIndex:0];
        NSString *value = [subParamStrs safeObjectAtIndex:1];
        [paramsDict safeSetObject:value forKey:key];
    }

    if (paramsDict[@"appName"]) {
        sourceAppName = paramsDict[@"appName"];
    }

    if (paramsDict[@"appId"]) {
        appId = paramsDict[@"appId"];
    }

    if (paramsDict[@"sourceApp"]) {
        sourceAppBundleId = paramsDict[@"sourceApp"];
    }
    routeType = OTSRouteTypeDeepLink;

    NSString *extraData = [OTSJsonKit stringFromDict:paramsDict];
    NSString *urlStr = [url.scheme stringByAppendingString:@"://"];
    urlStr = [urlStr stringByAppendingString:url.host];

    if (url.path.length > 0) {
        urlStr = [urlStr stringByAppendingString:url.path];
    }

    urlStr = [urlStr stringByAppendingString:[NSString stringWithFormat:@"?body=%@", extraData]];

    [[OTSRouter singletonInstance] routerWithUrl:[NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];

    return YES;
}

+ (BOOL)canHandleOpenURL:(NSURL *)url
{
    NSString *queryStr = [url.query stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSArray *paramStrs = [queryStr componentsSeparatedByString:@"&"];
    NSMutableDictionary *paramsDict = [@{} mutableCopy];

    for (NSString *subParamStr in paramStrs) {
        NSArray *subParamStrs = [subParamStr componentsSeparatedByString:@"="];
        NSString *key = [subParamStrs safeObjectAtIndex:0];
        NSString *value = [subParamStrs safeObjectAtIndex:1];
        [paramsDict safeSetObject:value forKey:key];
    }

    NSString *appkey = paramsDict[@"appId"];

    if ([url.scheme isEqualToString:@"yhd"] && (appkey.length > 0)) {
        return YES;
    }

    return  NO;
}

@end