//
//  UILabel + DynamicSize.h
//  OneStore
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UILabel(DynamicSize)
/**
 *	功能:根据内容动态适应高度
 */
- (void)resizeToFit;

/**
 *	功能:根据内容动态适应宽度
 */
- (void)resizeToStretch;
@end
