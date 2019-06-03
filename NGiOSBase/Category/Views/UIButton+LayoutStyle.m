//
//  UIButton+Expand.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UIButton+LayoutStyle.h"

#import "NSObject+swizzle.h"
#import <objc/runtime.h>

static const char * kNGUIButtonLayoutStyleKey;
static const char * kNGUIButtonLayoutSpacingKey;
static const char * kNeedLayoutForChangeStyle;
@interface UIButton()

@property (nonatomic, assign) BOOL needLayoutForChangeStyle;

@end
@implementation UIButton(LayoutStyle)

+ (void)load
{
    [self exchangeMethod:@selector(expadnLayoutSubViews) withMethod:@selector(layoutSubviews)];
}

- (void)setLayout:(NGUIButtonLayoutStyle )aLayoutStyle
		  spacing:(CGFloat)aSpacing
{
    
    self.layoutSpacing = aSpacing;
    self.layoutStyle = aLayoutStyle;
    
}

- (void)layoutButtoFrame
{
    if (!self.needLayoutForChangeStyle) {
        return;
    }
    self.needLayoutForChangeStyle = NO;
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets contentEdgeInsets = UIEdgeInsetsZero;
    
    CGFloat insetSpacing = self.layoutSpacing / 2.0f;
    
    /**
     *  主要思路:
     *  1. self.contentEdgeInsets的改变,才会改变UIButton的frame
     *  2. titleEdgeInsets,imageEdgeInsets的只修改坐标,
     *     如果只修改UIEdgeInsets的一边,那么坐标和frame都会变化,所以要左、右或者上、下对称修改
     */
    if (self.layoutStyle == NGImageLeftTitleRightStyle) {
        imageEdgeInsets     = UIEdgeInsetsMake(0, -insetSpacing, 0, insetSpacing );
        titleEdgeInsets     = UIEdgeInsetsMake(0, insetSpacing, 0, -insetSpacing);
        contentEdgeInsets   = UIEdgeInsetsMake(0, insetSpacing, 0, insetSpacing);
    }
    else if (self.layoutStyle == NGTitleLeftImageRightStyle) {
        CGFloat imageMoveRight = width - self.imageView.frame.origin.x * 2 - self.imageView.frame.size.width + insetSpacing;
        
        CGFloat titleMoveLeft = self.titleLabel.frame.origin.x - ( width - (self.titleLabel.frame.origin .x + titleSize.width)) + insetSpacing;
        
        imageEdgeInsets = UIEdgeInsetsMake(0, imageMoveRight, 0, -imageMoveRight);
        titleEdgeInsets = UIEdgeInsetsMake(0, -titleMoveLeft, 0, titleMoveLeft);
        contentEdgeInsets = UIEdgeInsetsMake(0, self.layoutSpacing / 2.0f, 0, self.layoutSpacing / 2.0f);
    }else{
        CGFloat currentHeigth = imageSize.height + titleSize.height + self.layoutSpacing;
        
        CGFloat currentWidth = imageSize.width;
        currentWidth = MAX(currentWidth, titleSize.width);
        
        CGFloat moveHeight = 0;
        CGFloat moveWidth = 0;
        CGFloat moveTop = 0;
        CGFloat moveBottom = 0;
        CGFloat moveRight = 0;
        CGFloat moveLeft = 0;
        
        if (height != currentHeigth) {
            moveHeight = (currentHeigth - height) / 2.0f;
        }
        
        if (width != currentWidth) {
            moveWidth = ((width - currentWidth) / 2.0f);
        }
        
        if ([@(height) compare:@(currentHeigth)] != NSOrderedSame
            || [@(width) compare:@(currentWidth)] != NSOrderedSame) {
            moveRight = moveWidth;
            //居中操作
            moveRight += (currentWidth / 2.0f - imageSize.width / 2.0f);
            moveRight -= self.imageView.frame.origin.x;
            
            moveLeft = moveWidth;
            //居中操作
            moveLeft += (currentWidth / 2.0f - titleSize.width / 2.0f);
            moveLeft -= (width - (self.titleLabel.frame.size.width  + self.titleLabel.frame.origin.x));
            if (self.layoutStyle == NGImageTopTitleBottomStyle){
                /**
                 *  image往上移动
                 */
                moveTop = self.imageView.frame.origin.y + moveHeight;
                imageEdgeInsets = UIEdgeInsetsMake(-moveTop, moveRight, moveTop, -moveRight);
                
                /**
                 *  title往下移动
                 */
                
                moveBottom = (height - (self.titleLabel.frame.origin.y + self.titleLabel.frame.size.height)) + moveHeight;
                titleEdgeInsets = UIEdgeInsetsMake(moveBottom, -moveLeft, -moveBottom, moveLeft);
            }else if (self.layoutStyle == NGTitleTopImageBottomStyle){
                /**
                 *  title往上移动
                 */
                moveTop = self.titleLabel.frame.origin.y + moveHeight;
                titleEdgeInsets = UIEdgeInsetsMake(-moveTop, -moveLeft, moveTop, moveLeft);
                
                /**
                 *
                 * image往下移动
                 */
                moveBottom = (height - (self.imageView.frame.origin.y + self.imageView.frame.size.height)) + moveHeight;
                imageEdgeInsets = UIEdgeInsetsMake(moveBottom, moveRight, -moveBottom, -moveRight);
                
            }
            contentEdgeInsets = UIEdgeInsetsMake(moveHeight, -moveWidth, moveHeight, -moveWidth);
        }else{
            contentEdgeInsets = self.contentEdgeInsets;
            imageEdgeInsets = self.imageEdgeInsets;
            titleEdgeInsets = self.titleEdgeInsets;
        }

    }
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
    self.contentEdgeInsets = contentEdgeInsets;
    
}
#pragma mark- setter & getter
- (void)setLayoutStyle:(NGUIButtonLayoutStyle)layoutStyle
{
    /**
     *  恢复默认状态
     */
    self.contentEdgeInsets = UIEdgeInsetsZero;
    self.titleEdgeInsets = UIEdgeInsetsZero;
    self.imageEdgeInsets = UIEdgeInsetsZero;
    
    objc_setAssociatedObject(self, &kNGUIButtonLayoutStyleKey, @(layoutStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.needLayoutForChangeStyle = YES;
}

- (NGUIButtonLayoutStyle)layoutStyle
{
    NSNumber *layoutStyleNum = objc_getAssociatedObject(self, &kNGUIButtonLayoutStyleKey);
    return layoutStyleNum.integerValue;
}

- (void)setLayoutSpacing:(CGFloat)layoutSpacing
{
    objc_setAssociatedObject(self, &kNGUIButtonLayoutSpacingKey, @(layoutSpacing), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.needLayoutForChangeStyle = YES;
}

- (CGFloat )layoutSpacing
{
    NSNumber *spacingNum = objc_getAssociatedObject(self, &kNGUIButtonLayoutSpacingKey);
    return spacingNum.floatValue;
}

- (BOOL)needLayoutForChangeStyle
{
    NSNumber *needChangeStyle = objc_getAssociatedObject(self, &kNeedLayoutForChangeStyle);
    return needChangeStyle.boolValue;
}

- (void)setNeedLayoutForChangeStyle:(BOOL)needLayoutForChangeStyle
{
    if (needLayoutForChangeStyle != self.needLayoutForChangeStyle) {
        objc_setAssociatedObject(self, &kNeedLayoutForChangeStyle, @(needLayoutForChangeStyle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

#pragma mark-
- (void)expadnLayoutSubViews
{
    [self expadnLayoutSubViews];
    if (self.layoutStyle != NGDefalutStyle) {
        [self layoutButtoFrame];
    }
}

@end
