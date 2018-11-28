//
//  UINavigationController+ots.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UINavigationController+ots.h"

@implementation UINavigationController (ots)

#pragma mark - navigetionbar type

- (void)setNavigationBarImage:(UIImage *)aImage
{
    [self.navigationBar setBackgroundImage:aImage forBarMetrics:UIBarMetricsDefault];
}

@end
