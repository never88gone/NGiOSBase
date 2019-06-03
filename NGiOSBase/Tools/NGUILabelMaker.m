//
//  NGUILabelMaker.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGUILabelMaker.h"
@interface NGUILabelMaker()

@property(nonatomic, strong)UILabel *label;

@end
@implementation NGUILabelMaker

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    self.backgroundColor = [UIColor clearColor];
    self.fontSize = [UIFont systemFontSize];
    self.numberOfLines = 1;
}

- (instancetype)initWithView:(UIView *)aView
{
    self = [super initWithView:aView];
    if (self) {
        [self initialization];
        if ([aView isKindOfClass:[UILabel class]]) {
            self.label = (UILabel*)aView;
        }
    }
    return self;
}

- (void)install
{
    [super install];
    [self.label setFont:[UIFont systemFontOfSize:self.fontSize]];
    self.label.numberOfLines = self.numberOfLines;
    self.label.textColor = self.textColor;
}
@end
