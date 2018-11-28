//
//  OTSTabBar.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSTabBarItem.h"

@class OTSTabBarItem,OTSTabBar;

@protocol OTSTabBarDelegate <NSObject>

- (void)customTabBar:(OTSTabBar *)tabBar didSelectItem:(OTSTabBarItem *)item;

@end

@interface OTSTabBar : UIView
/**
 *  背景图片
 */
@property (nonatomic, strong) UIImage *backgroundImage;
/**
 *  代理
 */
@property (nonatomic, weak) id<OTSTabBarDelegate> delegate;
/**
 *  当前选中的tabbarItem
 */
@property (nonatomic, weak, readonly) OTSTabBarItem *selectedItem;
/**
 *  当前选中的tabbarItem的序号
 */
@property (nonatomic, readonly) NSUInteger selectedIndex;

@end
