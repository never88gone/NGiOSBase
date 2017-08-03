//
//  OTSSegmentBtnView.m
//  OneStoreFramework
//
//  Created by Aimy on 14/12/1.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSSegmentBtnView.h"
#import "UIView+create.h"
#import "OTSView.h"
#import "UIImage+tool.h"
#import "UIView+FDCollapsibleConstraints.h"

@interface OTSSegmentBtnView ()

@property (nonatomic, strong) OTSView *helperView;

@property (nonatomic, strong) NSLayoutConstraint *constraint;

@end

@implementation OTSSegmentBtnView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.helperView = [OTSView autolayoutView];
        self.textLbl = [UILabel autolayoutView];
        self.textLbl.textAlignment = NSTextAlignmentCenter;
        self.numLbl = [UILabel autolayoutView];
        
        self.numLbl.font = [UIFont systemFontOfSize:10];
        self.numLbl.textAlignment = NSTextAlignmentCenter;
        [self.numLbl.layer setMasksToBounds:YES];
        [self.numLbl.layer setCornerRadius:8];
        [self addSubview:self.helperView];
        [self.helperView addSubview:self.textLbl];
        [self.helperView addSubview:self.numLbl];
        
        NSDictionary *variableBindings = NSDictionaryOfVariableBindings(_textLbl, _numLbl, _helperView);
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.helperView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.f constant:0.f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.helperView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f]];
        
        [self.helperView addConstraint:[NSLayoutConstraint constraintWithItem:self.textLbl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.helperView attribute:NSLayoutAttributeCenterY multiplier:1.f constant:0.f]];
        [self.helperView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_textLbl]-(5@999)-[_numLbl]" options:NSLayoutFormatAlignAllCenterY metrics:nil views:variableBindings]];
//        [self.textLbl autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//        [self.numLbl autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        
        NSLayoutConstraint * constraint =  [self.numLbl autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.textLbl withOffset:5];
        NSLayoutConstraint * widthConstraint = [self.numLbl autoSetDimension:ALDimensionWidth toSize:16];
       NSLayoutConstraint * heightConstraint = [self.numLbl autoSetDimension:ALDimensionWidth toSize:16];
        self.numLbl.fd_collapsibleConstraints = @[constraint,widthConstraint,heightConstraint];
       
        [self.helperView addConstraint:[NSLayoutConstraint constraintWithItem:self.helperView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.textLbl attribute:NSLayoutAttributeLeft multiplier:1.f constant:0.f]];
        [self.helperView addConstraint:[NSLayoutConstraint constraintWithItem:self.helperView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.numLbl attribute:NSLayoutAttributeRight multiplier:1.f constant:0.f]];
        
        self.textLbl.textColor = [UIColor redColor];
        self.numLbl.textColor = [UIColor whiteColor];
        self.numLbl.backgroundColor = [UIColor redColor];
        
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[[UIColor redColor] colorWithAlphaComponent:.1f]] forState:UIControlStateHighlighted];
    }
    return self;
}

- (void)setSelected:(BOOL)selected
{
    if (selected) {
        self.textLbl.textColor = [UIColor whiteColor];
        self.numLbl.textColor = [UIColor redColor];
        self.numLbl.backgroundColor = [UIColor whiteColor];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateHighlighted];
    }
    else {
        self.textLbl.textColor = [UIColor redColor];
        self.numLbl.textColor = [UIColor whiteColor];
        self.numLbl.backgroundColor = [UIColor redColor];
        [self setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageWithColor:[[UIColor redColor] colorWithAlphaComponent:.1f]] forState:UIControlStateHighlighted];
    }
}

- (void)updateLabels
{
    if (!self.numLbl.text.length) {
        self.numLbl.hidden = YES;
//        self.constraint.constant = 0.f;
    }
    else {
        self.numLbl.hidden = NO;
//        self.constraint.constant = 16.f;
    }
    self.numLbl.fd_collapsed = self.numLbl.hidden;
}

@end
