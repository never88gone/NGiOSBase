//
//  NSString+router.h
//  OneStoreFramework
//
//  Created by Aimy on 14-7-10.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

@interface NSString (router)

/**
 *  解析params
 *
 *  @param aJsonString string
 *
 *  @return dict
 */
+ (NSDictionary *)getDictFromJsonString:(NSString *)aJsonString;
/**
 *  组装router url,需要带上url scheme
 *
 *  @param urlString string(yhd://home,yhdiosfun://back)
 *  @param params    dict
 *
 *  @return string,已经url encoded,无需再编码
 */
+ (NSString *)getRouterUrlStringFromUrlString:(NSString *)urlString andParams:(NSDictionary *)params;
/**
 *  组装vc跳转url，yhd://home,无需带上url scheme
 *
 *  @param urlString string(home)
 *  @param params    dict,如无参数，填nil
 *
 *  @return stirng,已经url encoded,无需再编码
 */
+ (NSString *)getRouterVCUrlStringFromUrlString:(NSString *)urlString andParams:(NSDictionary *)params;
/**
 *  组装本地方法url，yhdiosfun://back,无需带上url scheme
 *
 *  @param urlString string(back)
 *  @param params    dict,如无参数，填nil
 *
 *  @return string,已经url encoded,无需再编码
 */
+ (NSString *)getRouterFunUrlStringFromUrlString:(NSString *)urlString andParams:(NSDictionary *)params;

@end
