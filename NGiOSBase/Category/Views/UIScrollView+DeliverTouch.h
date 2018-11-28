//
//  UIScrollView+DeliverTouch.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIScrollView (DeliverTouch)

/**
 *  在scrollView上的点击事件是否往上层(父视图)传递,默认是NO.
 *  如果设置为YES,在scrollView上的点击事件自己处理后，然后再传递给上层视图处理
 */
@property(nonatomic)IBInspectable BOOL deliverTouchEvent;

@end
