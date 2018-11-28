//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface UIView (EnlargeArea)

@property (nonatomic) IBInspectable CGFloat enlargeEdge;

/**
 *  设置需要扩大的范围
 *
 *  @param top    上边
 *  @param right  右边
 *  @param bottom 底边
 *  @param left   左边
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

@end
