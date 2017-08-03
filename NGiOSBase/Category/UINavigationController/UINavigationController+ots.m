//
//  UINavigationController+ots.m
//  OneStoreFramework
//
//  Created by Aimy on 4/8/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import "UINavigationController+ots.h"

@implementation UINavigationController (ots)

#pragma mark - navigetionbar type

- (void)setNavigationBarImage:(UIImage *)aImage
{
    [self.navigationBar setBackgroundImage:aImage forBarMetrics:UIBarMetricsDefault];
}

@end
