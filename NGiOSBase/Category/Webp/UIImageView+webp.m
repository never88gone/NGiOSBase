//
//  UIImageView+webp.m
//  OneStoreFramework
//
//  Created by huangjiming on 8/25/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import "UIImageView+webp.h"

//global
#import "OTSGlobalValue.h"
//category
#import "NSString+safe.h"
#import "UIImageView+WebCache.h"
#import "NSObject+swizzle.h"
//define
#import "OTSNotificationDefine.h"

@implementation UIImageView(webp)

+ (void)load
{
    SEL selectors[] = {
        @selector(sd_setImageWithURL:),
        @selector(sd_setImageWithURL:placeholderImage:),
        @selector(sd_setImageWithURL:placeholderImage:options:),
        @selector(sd_setImageWithURL:completed:),
        @selector(sd_setImageWithURL:placeholderImage:completed:),
        @selector(sd_setImageWithURL:placeholderImage:options:completed:),
        @selector(sd_setImageWithURL:placeholderImage:options:progress:completed:)
    };
    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"ots_webp_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        
        [self exchangeMethod:originalSelector withMethod:swizzledSelector];
    }
}

- (void)ots_webp_sd_setImageWithURL:(NSURL *)url
{
    [self p_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)ots_webp_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self p_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)ots_webp_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    [self p_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)ots_webp_sd_setImageWithURL:(NSURL *)url completed:(SDWebImageCompletionBlock)completedBlock
{
    [self p_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}

- (void)ots_webp_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self p_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}

- (void)ots_webp_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDWebImageCompletionBlock)completedBlock
{
    [self p_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)ots_webp_sd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock
{
    [self p_setImageWithURL:url placeholderImage:placeholder options:options progress:progressBlock completed:completedBlock];
}

#pragma mark - Inner
- (NSURL *)p_webpUrlFromJpgUrl:(NSURL *)url
{
    
    NSString *urlStr = [url absoluteString];
    if ([urlStr hasSuffix:@".jpg"] || [urlStr hasSuffix:@".JPG"]) {
        NSString *frontStr = [urlStr safeSubstringToIndex:urlStr.length-4];
        NSString *webpStr = [frontStr stringByAppendingString:@".webp"];
        return [NSURL URLWithString:webpStr];
    }
    return url;
}

- (void)p_setImageWithURL:(NSURL *)url
         placeholderImage:(UIImage *)placeholder
                  options:(SDWebImageOptions)options
                 progress:(SDWebImageDownloaderProgressBlock)progressBlock
                completed:(SDWebImageCompletionBlock)completedBlock
{
    NSURL *newUrl = [self p_webpUrlFromJpgUrl:url];
    NSDate *startDate = [NSDate date];
    WEAK_SELF;
    [self ots_webp_sd_setImageWithURL:newUrl placeholderImage:placeholder options:options progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        STRONG_SELF;
        if (cacheType == SDImageCacheTypeNone) {
            [self p_dealWithCdnLog:url.absoluteString startDate:startDate image:image error:error];
        }
        
        if (completedBlock) {
            completedBlock(image, error, cacheType, imageURL);
        }
    }];
}

- (void)p_dealWithCdnLog:(NSString *)url
               startDate:(NSDate *)startDate
                   image:(UIImage *)image
                   error:(NSError *)error
{
    NSDate *endDate = [NSDate date];
    NSTimeInterval timeInterval = [endDate timeIntervalSinceDate:startDate];//单位秒
    NSTimeInterval dTime = timeInterval * 1000;//单位毫秒
    if (dTime < 10) {//耗时少于10毫秒应该是读的缓存
        return;
    }
    NSInteger speed;//下载速率，单位kb/s
    if (error==nil && image!=nil) {
        NSData *imageData = nil;
        if ([url hasSuffix:@".png"] || [url hasSuffix:@".PNG"]) {
            imageData = UIImagePNGRepresentation(image);
        } else {
            imageData = UIImageJPEGRepresentation(image, 1);
        }
        NSUInteger length = imageData.length / 1024;//单位kb
        speed = length / timeInterval;//单位kb/s
    } else {
        speed = 0;
    }
    NSString *cdnLog = [NSString stringWithFormat:@"%zd#%zd", (NSInteger)dTime, speed];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:OTS_CDN_LOG object:cdnLog];
}

@end
