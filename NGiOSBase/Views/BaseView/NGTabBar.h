//
//  NGTabBar.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGTabBarItem.h"

@class NGTabBarItem,NGTabBar;

@protocol NGTabBarDelegate <NSObject>

- (void)customTabBar:(NGTabBar *)tabBar didSelectItem:(NGTabBarItem *)item;

@end

@interface NGTabBar : UIView
/**
 *  背景图片
 */
@property (nonatomic, strong) UIImage *backgroundImage;
/**
 *  代理
 */
@property (nonatomic, weak) id<NGTabBarDelegate> delegate;
/**
 *  当前选中的tabbarItem
 */
@property (nonatomic, weak, readonly) NGTabBarItem *selectedItem;
/**
 *  当前选中的tabbarItem的序号
 */
@property (nonatomic, readonly) NSUInteger selectedIndex;

@end
