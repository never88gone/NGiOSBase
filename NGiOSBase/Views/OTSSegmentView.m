//
//  OTSSegmentView.m
//  OneStoreFramework
//
//  Created by Aimy on 14/12/1.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSSegmentView.h"

#import "OTSFuncDefine.h"

#import "OTSConstraintHelper.h"
#import "OTSBorder.h"

#import "UIView+create.h"

@interface OTSSegmentView ()

@property (nonatomic, strong) NSMutableArray *btns;

@property (nonatomic, strong) OTSSegmentBtnView *currentSelectedBtn;

@end

@implementation OTSSegmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialization];
    }
    
    return self;
}

- (void)awakeFromNib
{
    [self initialization];
}

- (void)initialization
{
    self.btns = @[].mutableCopy;
    [self.layer setBorderWidth:1.0f];
    [self.layer setBorderColor:[UIColor redColor].CGColor];
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:5.0f];
}



- (void)reloadData
{
    self.currentSelectedBtn = nil;
    
    NSInteger count = [self.delegate numberOfSegmentBtnInSegment:self];
    
    [self.btns makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.btns removeAllObjects];
    
    if (self.btns.count < count) {
        for (NSUInteger i = self.btns.count; i < count; i++) {
            OTSSegmentBtnView *btn = [OTSSegmentBtnView autolayoutView];
            [btn addTarget:self action:@selector(onPressedBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.btns addObject:btn];
            [self addSubview:btn];
        }
    }
    
    [OTSConstraintHelper setViews:self.btns equalToSuperview:self isHorizontal:YES];
    
    for (OTSSegmentBtnView *view in self.btns) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.f constant:0.f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.f constant:0.f]];
    }
    
    WEAK_SELF;
    [self.btns enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        STRONG_SELF;
        OTSSegmentBtnView *btn = obj;
        btn.tag = idx;
        [self.delegate segment:self configSegmentBtn:btn atIndex:idx];
        [btn updateLabels];
        
        [OTSBorder removeBorderWithView:btn type:OTSBorderTypeAll];
        
        if (idx != 0) {
            [OTSBorder addBorderWithView:btn type:OTSBorderTypeLeft andColor:[UIColor redColor]];
        }
        
        if (idx == self.selectedIndex) {
            self.currentSelectedBtn = btn;
            self.currentSelectedBtn.selected = YES;
        }
    }];
    
    if (!self.currentSelectedBtn) {
        self.currentSelectedBtn = self.btns.firstObject;
        self.currentSelectedBtn.selected = YES;
        self.selectedIndex = 0;
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    _selectedIndex = selectedIndex;
    [self.btns[selectedIndex] sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)onPressedBtn:(OTSSegmentBtnView *)sender
{
    if (self.currentSelectedBtn == sender) {
        return;
    }
    
    _selectedIndex = sender.tag;
    self.currentSelectedBtn.selected = NO;
    self.currentSelectedBtn = sender;
    self.currentSelectedBtn.selected = YES;
    
    [self.delegate segment:self didSelectedIndex:sender.tag];
}

@end
