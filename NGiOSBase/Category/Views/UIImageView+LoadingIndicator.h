//
//  UIImageView+LoadingIndicator.h
//  OneStoreFramework
//
//  Created by Vect Xi on 11/3/14.
//  Copyright (c) 2014 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LoadingIndicator)

- (void)ots_setImageWithURL:(NSURL *)url
                showLoading:(BOOL)showLoading
             indicatorStype:(UIActivityIndicatorViewStyle)style
           placeholderImage:(UIImage *)image
                    options:(SDWebImageOptions)options;

@end
