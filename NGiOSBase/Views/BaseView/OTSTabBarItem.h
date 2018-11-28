//
//  OTSTabBarItem.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OTSTabBarItem;

@protocol OTSTabBarItemDelegate <NSObject>

- (void)tabBarItemDidSelectItem:(OTSTabBarItem *)item;

@end

@interface OTSTabBarItem : UIView
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  标题label
 */
@property (nonatomic, strong, readonly) UILabel *titleLabel;
/**
 *  默认图片
 */
@property (nonatomic, strong) UIImage *image;
/**
 *  选中时候的图片
 */
@property (nonatomic, strong) UIImage *selectedImage;
/**
 *  图片的偏移
 */
@property (nonatomic) UIEdgeInsets imageInsets;
/**
 *  提示字符
 */
@property (nonatomic, copy) NSString *badgeValue;
/**
 *  显示红点指示
 */
@property (nonatomic) BOOL showIndicate;
/**
 *  是否选中
 */
@property (nonatomic, getter = isSelected) BOOL selected;
/**
 *  是否显示标题
 */
@property (nonatomic, getter = isShowWord) BOOL showWord;
/**
 *  代理
 */
@property (nonatomic, weak) id<OTSTabBarItemDelegate> delegate;
/**
 *  创建函数
 *
 *  @param title         标题
 *  @param image         默认图片
 *  @param selectedImage 选中时候的图片
 *
 *  @return OTSTabBarItem
 */
+ (instancetype)itemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage;

@end
