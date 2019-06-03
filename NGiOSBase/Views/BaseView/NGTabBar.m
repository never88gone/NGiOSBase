//
//  NGTabBar.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGTabBar.h"
//tool
#import "NGLog.h"
#import "NGConstraintHelper.h"
//category
#import "UIView+create.h"

@interface NGTabBar () <NGTabBarItemDelegate>

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *backgroundImageView;

@end

@implementation NGTabBar

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
    [NGConstraintHelper setView:self.backgroundView fullAsSuperview:self];
    
    self.backgroundImageView = [UIImageView viewWithFrame:CGRectZero];
    [self.backgroundView addSubview:self.backgroundImageView];
    [NGConstraintHelper setView:self.backgroundImageView fullAsSuperview:self.backgroundView];
}

- (void)__resizeItems
{
    for (NGTabBarItem *item in _items) {
        item.tag = [_items indexOfObject:item];
        [self addSubview:item];
        item.delegate = self;
        
        item.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:0.f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:item attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
    }
    
    [NGConstraintHelper setViews:self.items equalToSuperview:self isHorizontal:YES];
}

- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    self.backgroundImageView.image = backgroundImage;
}

- (void)setItems:(NSArray *)items
{
    for (id object in items) {
        if (![object isKindOfClass:[NGTabBarItem class]]) {
            NGLogE(@"%@ is not kind of NGTabBarItem",object);
            return ;
        }
    }
    
    [_items makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _items = [items copy];
    
    self.selectedItem = _items[0];
    
    [self __resizeItems];
}

- (void)setSelectedItem:(NGTabBarItem *)selectedItem
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

#pragma mark - NGTabBarItem delegate
- (void)tabBarItemDidSelectItem:(NGTabBarItem *)item
{
    [self.delegate customTabBar:self didSelectItem:item];
}

@end
