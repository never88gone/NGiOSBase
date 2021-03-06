//
//  NGPriceLabel.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    NGPriceTextAlignmentLeft = 0,
    NGPriceTextAlignmentCenter,
    NGPriceTextAlignmentRight
} NGPriceTextAlignment;

@interface NGPriceAndScoreLabel : UILabel

/**
 *  当价格为零的时候是否也显示
 */
@property (nonatomic, assign) BOOL shouldShowPriceEvenIfZero;

@property(nonatomic, assign) NGPriceTextAlignment alignment;

/**
 *  功能:刷新显示，可以显示积分 + 价格
 */
- (void)updateWithPrice:(double)aPrice point:(int)aPoint color:(UIColor *)aColor integerFont:(UIFont *)aFont decimalFont:(UIFont *)bFont;

/**
 *  功能:刷新显示，只显示价格
 */
- (void)updateWithPrice:(double)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aFont decimalFont:(UIFont *)bFont;

/**
 *	功能:刷新显示，是否显示划线
 */
- (void)updateWithPrice:(double)aPrice
                  color:(UIColor *)aColor
            integerFont:(UIFont *)aFont
            decimalFont:(UIFont *)bFont
              isCrossed:(BOOL)isCrossed;

/**
 *  功能:刷新显示，可以显示"积分 + 价格"或者"价格 + 积分"
 */
- (void)updateWithPrice:(double)aPrice point:(int)aPoint color:(UIColor *)aColor integerFont:(UIFont *)aFont decimalFont:(UIFont *)bFont firstShowPrice:(BOOL)aFirstShowPrice;

/**
 *  功能:返回内容的长度,为了团购首页中新加了省钱，要紧跟在价格后面要用到
 */
- (CGFloat)getMyStrLength;

/**
 *	功能:在Label上滑横线
 */
- (void)crossed;
@end
