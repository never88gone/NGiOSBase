//
//  UIImage+bundleRes.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
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
