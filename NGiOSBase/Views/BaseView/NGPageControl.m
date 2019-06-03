//
//  NGPageControl.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGPageControl.h"

@implementation NGPageControl

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    [super setNumberOfPages:numberOfPages];
    [self updateDNG];
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    if ([super respondsToSelector:@selector(setCurrentPage:)]) {
        [super setCurrentPage:currentPage];
        [self updateDNG];
    }
}

-(void)updateDNG
{
    for (UIView *subView in self.subviews) {
        
        __block UIImageView* dot = nil;
        [subView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                dot = (UIImageView *)obj;
                *stop = YES;
            }
        }];
        if (dot == nil) {
            dot = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, subView.frame.size.width, subView.frame.size.height)];
            [subView addSubview:dot];
        }
        
        UIColor *currentColor = self.isChangeColor ?self.changeColor :[UIColor whiteColor];
        //显示图片时,默认的样式都要隐藏
        if (self.currentPage == [self.subviews indexOfObject:subView]) {
            subView.backgroundColor = self.fillColor ?: currentColor;
            if (self.activeImage) {
                dot.image = self.activeImage;
                subView.backgroundColor = [UIColor clearColor];
                self.borderColor = [UIColor clearColor];
                self.borderWidth = 0;
            }
        }
        else {
            subView.backgroundColor = self.pageFillColor ?: [UIColor clearColor];
            if (self.inactiveImage) {
                dot.image = self.inactiveImage;
                subView.backgroundColor = [UIColor clearColor];
                self.borderColor = [UIColor clearColor];
                self.borderWidth = 0;
            }
        }
        
        subView.layer.borderColor = self.borderColor.CGColor ?: currentColor.CGColor;
     
        subView.layer.borderWidth = self.borderWidth?:1.f;
        
    }
}

@end
