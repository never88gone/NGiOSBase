//
//  UIViewController+custom.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UIViewController+custom.h"
//category
#import "UIImage+bundleRes.h"

static const CGFloat NGUpdownLayoutNaviBtnImgWidth = 24.0;
static const CGFloat NGUpdownLayoutNaviBtnTitleHeight = 14.0;

@implementation NGDataNaviBtn

@end

@implementation NGUpdownLayoutNaviBtn
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(contentRect.size.width/2-NGUpdownLayoutNaviBtnImgWidth/2, contentRect.size.height/2-(NGUpdownLayoutNaviBtnImgWidth+NGUpdownLayoutNaviBtnTitleHeight)/2, NGUpdownLayoutNaviBtnImgWidth, NGUpdownLayoutNaviBtnImgWidth);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, contentRect.size.height/2-(NGUpdownLayoutNaviBtnImgWidth+NGUpdownLayoutNaviBtnTitleHeight)/2+NGUpdownLayoutNaviBtnImgWidth, contentRect.size.width, NGUpdownLayoutNaviBtnTitleHeight);
}

@end

@implementation UIViewController (custom)



#pragma mark - navi button
/**
 *  功能:设置左按钮的类型（图片）
 *
 *  @param btnImage  按钮类型
 *  @param aFrame 图片大小(理论上只需要设置size就行)
 */
- (void)setNaviButtonImage:(UIImage*)btnImage
                    frame:(CGRect)aFrame
{
    [self setNaviButtonImage:btnImage isBgImg:NO frame:aFrame text:nil color:nil font:nil shadowOffset:CGSizeZero alignment:UIControlContentHorizontalAlignmentLeft edgeInsets:UIEdgeInsetsZero isLeft:YES];
}
/**
 *  功能:设置左按钮的类型（图片+文字）
 *  type:按钮类型  aFrame:大小  text:文字   color:颜色  font:样式
 */
- (void)setNaviButtonImage:(UIImage*)btnImage
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
{
    [self setNaviButtonImage:btnImage isBgImg:NO frame:aFrame text:aText color:aColor font:aFont shadowOffset:CGSizeZero alignment:UIControlContentHorizontalAlignmentLeft edgeInsets:UIEdgeInsetsZero isLeft:YES];
}

- (void)setNaviButtonImage:(UIImage*)btnImage
                  isBgImg:(BOOL)aIsBgImg
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (CGRectEqualToRect(CGRectZero, aFrame)) {
        btn.frame = CGRectMake(0, 0, 24, 24);
    }
    else {
        btn.frame = aFrame;
    }
    
    SEL selector = nil;
    if (aLeft) {
        selector = @selector(leftBtnClicked:);
    }
    else {
        selector = @selector(rightBtnClicked:);
    }
    
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    //根据样式不同更改按钮图片
    UIImage *normalImage = btnImage;
    UIImage *highlightImage = btnImage;
       
    if (aIsBgImg) {
        [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
        [btn setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    } else {
        [btn setImage:normalImage forState:UIControlStateNormal];
        [btn setImage:highlightImage forState:UIControlStateHighlighted];
    }
    
    //按钮文字
    if (aText != nil) {
        [btn setTitle:aText forState:UIControlStateNormal];
    }
    
    if (aColor) {
        [btn setTitleColor:aColor forState:UIControlStateNormal];
    }
    
    if (aFont) {
        btn.titleLabel.font = aFont;
    }
    
    if (!CGSizeEqualToSize(CGSizeZero, aShadowOffset)) {
        btn.titleLabel.shadowOffset = aShadowOffset;
    }
    
    btn.contentHorizontalAlignment = aAlignment;
    
    if (!UIEdgeInsetsEqualToEdgeInsets(aEdgeInsets, UIEdgeInsetsZero)) {
        btn.contentEdgeInsets = aEdgeInsets;
    }
    
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if (aLeft) {
        self.navigationItem.leftBarButtonItem = btnItem;
    }
    else {
        self.navigationItem.rightBarButtonItem = btnItem;
    }
}

- (void)setNaviButtonImage:(UIImage*)btnImage
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft
{
    [self setNaviButtonImage:btnImage isBgImg:NO frame:aFrame text:aText color:aColor font:aFont shadowOffset:aShadowOffset alignment:aAlignment edgeInsets:aEdgeInsets isLeft:aLeft];
}

- (void)setNaviButtonImage:(UIImage*)btnImage isLeft:(BOOL)aLeft
{
    [self setNaviButtonImage:btnImage frame:CGRectZero text:nil color:nil font:nil shadowOffset:CGSizeZero alignment:UIControlContentHorizontalAlignmentLeft edgeInsets:UIEdgeInsetsZero isLeft:aLeft];
}

- (void)setNaviButtonText:(NSString *)aText isLeft:(BOOL)aLeft
{
    [self setNaviButtonImage:nil frame:CGRectMake(0, 0, 40, 40) text:aText color:[UIColor colorWithRed:102.0/255 green:102.0/255 blue:102.0/255 alpha:1] font:[UIFont systemFontOfSize:14.0] shadowOffset:CGSizeZero alignment:UIControlContentHorizontalAlignmentCenter edgeInsets:UIEdgeInsetsZero isLeft:aLeft];
}

- (void)leftBtnClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnClicked:(id)sender
{
    
}

@end
