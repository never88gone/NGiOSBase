//
//  UIImage+bundleRes.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
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
