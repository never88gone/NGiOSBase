//
//  UIImage+bundleRes.h
//  OneStoreFramework
//
//  Created by Aimy on 14-7-24.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>
//define
#import "OTSMacroDefine.h"

@interface UIImage (bundleRes)

/**
 *  从bundle中创建image
 *
 *  @param name       image名称
 *  @param bundleName bundle名称
 *
 *  @return UIImage
 */
+ (UIImage *)imageNamed:(NSString *)name bundleName:(NSString *)bundleName;

@end
