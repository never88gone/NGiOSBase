//
//  NSString+CSSHtml.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NSString+CSSHtml.h"

@implementation NSString (CSSHtml)

- (NSString *)getAlignCenterCssHtml
{
    return  [NSString stringWithFormat:@"<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta name=\"viewport\" content=\"width=750, maximum-scale=1.5\"><style type=\"text/css\">.webview_ios{text-align:left;word-wrap:break-word}.webview_ios img{text-align:center;max-width:100%%}.webview_ios ul{padding:0}table{font-size:25px}table .ull{width:auto !important;height:auto !important;}</style></head><body><div class=\"webview_ios\">%@</div></body>",self];
}
- (NSString *)getWirelessAlignCenterCssHtml{
    return [NSString stringWithFormat:@"<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta name=\"viewport\" content=\"width=device-width, maximum-scale=1.5\"><style type=\"text/css\">.webview_ios{text-align:left;word-wrap:break-word}.webview_ios img{max-width:100%%}.webview_ios ul{padding:0}table .ull{width:auto !important;height:auto !important;}</style></head><body><div class=\"webview_ios\">%@</div></body>",self];
}
- (NSString *)getPCAlignCenterCssHtml{
    return [NSString stringWithFormat:@"<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"/><meta name=\"viewport\" content=\"width=750, maximum-scale=1.5\"><style type=\"text/css\">.webview_ios{text-align:left;word-wrap:break-word}.webview_ios img{max-width:100%%}.webview_ios ul{padding:0}table{font-size:25px}table .ull{width:auto !important;height:auto !important;}</style></head><body><div class=\"webview_ios\">%@</div></body>",self];
}
- (NSString *)getTheOtherOneAlignCenterCssHtml
{
   
    //不缩放方法
    NSString *result = [NSString stringWithFormat:@"<!DOCTYPE html><html><head><meta name=\"viewport\" content=\"width=750, user-scalable=0\" charset=\"UTF-8\"><style type=\"text/css\">.webview_ios{text-align:left;word-wrap:break-word}.webview_ios img{max-width:100%%}.webview_ios ul{padding:0}table{font-size:25px}</style></head><body><div class=\"webview_ios\">%@</div></body></html>",self];
    
    //缩放方法
//     NSString *result = [NSString stringWithFormat:@"<!DOCTYPE html><html><head><meta name=\"viewport\" content=\"width=750, maximum-scale=1.5\" charset=\"UTF-8\"><style type=\"text/css\">.webview_ios{text-align:left;word-wrap:break-word}.webview_ios img{max-width:100%%}.webview_ios ul{padding:0}table{font-size:25px}</style></head><body><div class=\"webview_ios\">%@</div></body></html>",self];
    
    return  result;
}

@end
