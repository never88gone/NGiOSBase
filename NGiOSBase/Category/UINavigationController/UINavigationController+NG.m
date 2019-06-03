//
//  UINavigationController+NG.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UINavigationController+NG.h"

@implementation UINavigationController (NG)

#pragma mark - navigetionbar type

- (void)setNavigationBarImage:(UIImage *)aImage
{
    [self.navigationBar setBackgroundImage:aImage forBarMetrics:UIBarMetricsDefault];
}

@end
