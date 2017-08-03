//
//  UIImageView+LoadingIndicator.m
//  OneStoreFramework
//
//  Created by Vect Xi on 11/3/14.
//  Copyright (c) 2014 OneStore. All rights reserved.
//

#import "UIImageView+LoadingIndicator.h"
#import "UIImageView+webp.h"

@implementation UIImageView (LoadingIndicator)

- (void)ots_setImageWithURL:(NSURL *)url
                showLoading:(BOOL)showLoading
             indicatorStype:(UIActivityIndicatorViewStyle)style
           placeholderImage:(UIImage *)image
                    options:(SDWebImageOptions)options
{
    [self ots_setImageWithURL:url
                  showLoading:showLoading
               indicatorStype:style
             placeholderImage:image
                      options:options
                     progress:nil
                    completed:nil];
}

- (void)ots_setImageWithURL:(NSURL *)url
                showLoading:(BOOL)showLoading
             indicatorStype:(UIActivityIndicatorViewStyle)style
           placeholderImage:(UIImage *)placeholder
                    options:(SDWebImageOptions)options
                   progress:(SDWebImageDownloaderProgressBlock)progressBlock
                  completed:(SDWebImageCompletionBlock)completedBlock
{
    UIActivityIndicatorView *indicator = nil;
    if (showLoading) {
        indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
        [self addSubview:indicator];
        indicator.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        [indicator startAnimating];
    }

    [self sd_setImageWithURL:url
            placeholderImage:placeholder
                     options:options
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (showLoading && indicator) {
                           [indicator stopAnimating];
                           [indicator removeFromSuperview];
                       }
                       
                       if (completedBlock) {
                           completedBlock(image, error, cacheType, imageURL);
                       }
                   }];
}

@end
