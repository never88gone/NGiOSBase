//
//  OTSTabBar.h
//  OneStoreFramework
//
//  Created by Aimy on 14-7-14.
//  Copyright (c) 2014年 OneStore. All rights reserved.
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
