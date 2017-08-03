//
//  UIImage+bundleRes.m
//  OneStoreFramework
//
//  Created by Aimy on 14-7-24.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "UIImage+bundleRes.h"

@implementation UIImage (bundleRes)

+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName
{
    if (bundleName.length) {
        name = [NSString stringWithFormat:@"%@.bundle/%@",bundleName,name];
    }
    
    return [UIImage imageNamed:name];
}

@end
