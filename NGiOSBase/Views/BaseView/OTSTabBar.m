//
//  OTSTabBar.m
//  OneStoreFramework
//
//  Created by Aimy on 14-7-14.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSTabBar.h"
//tool
#import "OTSLog.h"
#import "OTSConstraintHelper.h"
//category
#import "UIView+create.h"

@interface OTSTabBar () <OTSTabBarItemDelegate>

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation OTSTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.backgroundView = [UIImageView viewWithFrame:CGRectZero];
    [self addSubview:self.backgroundView];
    [OTSConstraintHelper setView:self.backgroundView fullAsSuperview:self];
    
    self.backgroundImageView = [UIImageView viewWithFrame:CGRectZero];
    [self.backgroundView addSubview:self.backgroundImageView];
    [OTSConstraintHelper setView:self.backgroundImageView fullAsSuperview:self.backgroundView];
}

- (void)__resizeItems
{
    for (OTSTabBarItem *item in _items) {
        item.tag = [_items indexOfObject:item];
        [self addSubview:item];
        item.delegate = self;
        
        item.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:0.f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
    }
    
    [OTSConstraintHelper setViews:self.items equalToSuperview:self isHorizontal:YES];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.backgroundImageView.image = backgroundImage;
}

- (void)setItems:(NSArray *)items
{
    for (id object in items) {
        if (![object isKindOfClass:[OTSTabBarItem class]]) {
            OTSLogE(@"%@ is not kind of OTSTabBarItem",object);
            return ;
        }
    }
    
    [_items makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _items = [items copy];
    
    self.selectedItem = _items[0];
    
    [self __resizeItems];
}

- (void)setSelectedItem:(OTSTabBarItem *)selectedItem
{
    if (_selectedItem == selectedItem) {
        _selectedItem.selected = YES;
        return ;
    }
    
    _selectedItem.selected = NO;
    _selectedItem = selectedItem;
    _selectedItem.selected = YES;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [self.delegate customTabBar:self didSelectItem:_items[selectedIndex]];
}

- (NSUInteger)selectedIndex
{
    return self.selectedItem.tag;
}

#pragma mark - OTSTabBarItem delegate
- (void)tabBarItemDidSelectItem:(OTSTabBarItem *)item
{
    [self.delegate customTabBar:self didSelectItem:item];
}

@end
