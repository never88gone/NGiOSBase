//
//  OTSCorner.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTSCorner : NSObject

/**
 *  为UIView添加某几个角的圆角
 *
 *  @param aView    输入view
 *  @param aCorners 角
 *  @param aSize    圆角size
 */
+ (void)addCornerWithView:(UIView *)aView type:(UIRectCorner)aCorners size:(CGSize)aSize;

@end
