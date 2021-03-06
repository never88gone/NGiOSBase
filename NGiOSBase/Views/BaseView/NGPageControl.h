//
//  NGPageControl.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGPageControl : UIPageControl

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *pageFillColor; //没有选中点的颜色
@property (nonatomic, assign) NSInteger borderWidth;
@property (nonatomic, strong) UIColor *changeColor;
@property (nonatomic, assign) BOOL isChangeColor;

/**
 *  选中时的图片
 */
@property (nonatomic, strong) UIImage *activeImage;

/**
 *  非选中时的图片
 */
@property (nonatomic, strong) UIImage *inactiveImage;




@end
