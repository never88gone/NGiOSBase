//
//  UIViewController+custom.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTSDataNaviBtn : UIButton

@property(nonatomic, copy) NSString *href;
@property(nonatomic, strong) NSArray *items;

@end

@interface OTSUpdownLayoutNaviBtn : OTSDataNaviBtn

@end

@interface UIViewController (custom)

#pragma mark - navi button

/**
 *  功能:设置左按钮的类型（图片）
 *
 *  @param btnImage  按钮类型
 *  @param aFrame 图片大小(理论上只需要设置size就行)
 */
- (void)setNaviButtonImage:(UIImage*)btnImage
                    frame:(CGRect)aFrame;
/**
 *  功能:设置左按钮的类型（图片+文字）
 *  type:按钮类型  aFrame:大小  text:文字   color:颜色  font:样式
 */
- (void)setNaviButtonImage:(UIImage*)btnImage
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont;



- (void)setNaviButtonImage:(UIImage*)btnImage
                  isBgImg:(BOOL)aIsBgImg
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft;

/**
 *  功能:设置左/右按钮的类型（图片）和文字（包括颜色大小样式）
 *  type:按钮类型   text:文字   color:颜色  font:样式   alignment:对齐方式  edgeInsets:边距 shadowOffset:阴影偏移量  aLeft:是否是左按钮
 */
- (void)setNaviButtonImage:(UIImage*)btnImage
                    frame:(CGRect)aFrame
                     text:(NSString *)aText
                    color:(UIColor *)aColor
                     font:(UIFont *)aFont
             shadowOffset:(CGSize)aShadowOffset
                alignment:(UIControlContentHorizontalAlignment)aAlignment
               edgeInsets:(UIEdgeInsets)aEdgeInsets
                   isLeft:(BOOL)aLeft;

/**
 *  功能:设置左按钮类型（图片）
 *  type:按钮类型
 */
- (void)setNaviButtonImage:(UIImage*)btnImage isLeft:(BOOL)aLeft;

/**
 *  功能:设置按钮文字
 *  aText:按钮文字
 */
- (void)setNaviButtonText:(NSString *)aText isLeft:(BOOL)aLeft;

/**
 *  功能:左按钮点击行为，可在子类重写此方法
 */
- (void)leftBtnClicked:(id)sender;

/**
 *  功能:右按钮点击行为，可在子类重写此方法
 */
- (void)rightBtnClicked:(id)sender;

@end
