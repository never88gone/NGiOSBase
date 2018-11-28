//
//  OTSPriceLabel.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSPriceAndScoreLabel.h"

@interface OTSPriceAndScoreLabel()

@property(nonatomic, assign) double price;
@property(nonatomic, assign) int point;
@property(nonatomic, strong) UIColor *color;
@property(nonatomic, strong) UIFont *integerFont;
@property(nonatomic, strong) UIFont *decimalFont;
@property(nonatomic, strong) NSString *pointNum;//积分
@property(nonatomic, strong) NSString *pointString;//@"积分"
@property(nonatomic, strong) NSString *addString;//" + "
@property(nonatomic, strong) NSString *headString;//@"¥"
@property(nonatomic, strong) NSString *integerString;//整数部分
@property(nonatomic, strong) NSString *decimalString;//小数部分
@property(nonatomic, assign) double startXValue;
@property(nonatomic, assign) CGFloat strLenth;

@property(nonatomic, assign) BOOL isCrossed; //是否划横线
@property(nonatomic, assign) BOOL firstShowPrice;//是否优先显示价格("¥5.5 + 20积分" 还是 "20积分 + ¥5.5")

@end

@implementation OTSPriceAndScoreLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

/**
 *  功能:绘制积分
 *  aX:绘制位置的X的值
 *  返回:绘制之后新的X的值
 */
- (CGFloat)drawPointFromX:(CGFloat)aX
{
    double xValue = aX;
    if (self.pointNum!=nil && self.pointString!=nil) {
        //积分绘制
        CGFloat pointNumWidth = [self.pointNum sizeWithAttributes:@{NSFontAttributeName:self.integerFont}].width;
        CGFloat pointNumHeight = [self.pointNum sizeWithAttributes:@{NSFontAttributeName:self.integerFont}].height;
        CGFloat pointStrWidth = [self.pointString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].width;
        CGFloat pointStrHeight = [self.pointString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].height;
        
        if (self.integerFont.pointSize > self.decimalFont.pointSize) {
            [self.pointNum drawAtPoint:CGPointMake(xValue, self.frame.size.height/2+pointStrHeight/2-pointNumHeight+1) withAttributes:@{NSFontAttributeName:self.integerFont,NSForegroundColorAttributeName:self.color}];
        } else {
            [self.pointNum drawAtPoint:CGPointMake(xValue, self.frame.size.height/2+pointStrHeight/2-pointNumHeight) withAttributes:@{NSFontAttributeName:self.integerFont,NSForegroundColorAttributeName:self.color}];
        }
        
        xValue += pointNumWidth;
        
        //"积分"绘制
        [self.pointString drawAtPoint:CGPointMake(xValue, self.frame.size.height/2-pointStrHeight/2) withAttributes:@{NSFontAttributeName:self.decimalFont,NSForegroundColorAttributeName:self.color}];
        
        xValue += pointStrWidth;
    }
    
    return xValue;
}

/**
 *  功能:绘制积分
 *  aX:绘制位置的X的值
 *  返回:绘制之后新的X的值
 */
- (CGFloat)drawAddFromX:(CGFloat)aX
{
    double xValue = aX;
    
    if (self.pointNum!=nil && self.pointString!=nil && self.addString!=nil && self.headString!=nil && self.integerString!=nil && self.decimalString!=nil) {
        //" + "绘制
        CGFloat addStrWidth = [self.addString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].width;
        CGFloat addStrHeight = [self.addString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].height;
        
        [self.addString drawAtPoint:CGPointMake(xValue, self.frame.size.height/2-addStrHeight/2) withAttributes:@{NSFontAttributeName:self.decimalFont,NSForegroundColorAttributeName:self.color}];
        
        xValue += addStrWidth;
    }
    
    return xValue;
}

/**
 *  功能:绘制价格
 *  aX:绘制位置的X的值
 *  返回:绘制之后新的X的值
 */
- (CGFloat)drawPriceFromX:(CGFloat)aX
{
    double xValue = aX;
    
    if (self.headString!=nil && self.integerString!=nil && self.decimalString!=nil) {
        //@"¥"的绘制
        CGFloat headWidth = [self.headString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].width;
        CGFloat headHeight = [self.headString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].height;
        [self.headString drawAtPoint:CGPointMake(xValue, self.frame.size.height/2-headHeight/2) withAttributes:@{NSFontAttributeName:self.decimalFont,NSForegroundColorAttributeName:self.color}];
        
        xValue += headWidth;
        
        //整数绘制
        CGFloat integerWidth = [self.integerString sizeWithAttributes:@{NSFontAttributeName:self.integerFont}].width;
        CGFloat integerHeight = [self.integerString sizeWithAttributes:@{NSFontAttributeName:self.integerFont}].height;
        if (self.integerFont.pointSize > self.decimalFont.pointSize) {
            [self.integerString drawAtPoint:CGPointMake(xValue, self.frame.size.height/2+headHeight/2-integerHeight+1) withAttributes:@{NSFontAttributeName:self.integerFont,NSForegroundColorAttributeName:self.color}];
        } else {
            [self.integerString drawAtPoint:CGPointMake(xValue, self.frame.size.height/2+headHeight/2-integerHeight) withAttributes:@{NSFontAttributeName:self.integerFont,NSForegroundColorAttributeName:self.color}];
        }
        
        xValue += integerWidth;
        
        //小数绘制
        CGFloat decimalWidth = [self.decimalString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].width;
        CGFloat decimalHeight = [self.decimalString sizeWithAttributes:@{NSFontAttributeName:self.decimalFont}].height;
        [self.decimalString drawAtPoint:CGPointMake(xValue, self.frame.size.height/2-decimalHeight/2) withAttributes:@{NSFontAttributeName:self.decimalFont,NSForegroundColorAttributeName:self.color}];
        xValue += decimalWidth;
    }
    
    return xValue;
}

/**
 *  功能:绘制划线
 */
- (void)drawCrossLine
{
    if (self.isCrossed) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1.0);
        
        // Draw a single line from left to right
        CGFloat width = self.bounds.size.width;
        if ([self getMyStrLength]) {
            width = [self getMyStrLength];
        }
        CGFloat xValue = 0.0;
        CGContextMoveToPoint(context, 0, self.frame.size.height / 2);
        CGContextAddLineToPoint(context, xValue + width, self.frame.size.height / 2);
        CGContextStrokePath(context);
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.color set];
    CGFloat xValue = self.startXValue;
    if (self.firstShowPrice) {
        xValue = [self drawPriceFromX:xValue];
        xValue = [self drawAddFromX:xValue];
        xValue = [self drawPointFromX:xValue];
    } else {
        xValue = [self drawPointFromX:xValue];
        xValue = [self drawAddFromX:xValue];
        xValue = [self drawPriceFromX:xValue];
    }
    
    [self drawCrossLine];
}

- (void)updateWithPrice:(double)aPrice point:(int)aPoint color:(UIColor *)aColor integerFont:(UIFont *)aFont decimalFont:(UIFont *)bFont
{
    self.price = aPrice;
    self.point = aPoint;
    self.color = aColor;
    self.integerFont = aFont;
    self.decimalFont = bFont;
    
    //获取需要绘制的积分字符串
    if (self.point > 0) {
        self.pointNum = [NSString stringWithFormat:@"%d", self.point];
        self.pointString = @"积分";
    } else {
        self.pointNum = nil;
        self.pointString = nil;
    }
    
    //获取需要绘制的加号
    if (self.point>0 && (self.shouldShowPriceEvenIfZero || (!self.shouldShowPriceEvenIfZero && self.price>0))) {
        self.addString = @" + ";
    } else {
        self.addString = nil;
    }
    
    //获取需要绘制的价格字符串
    NSString *priceStr = [NSString stringWithFormat:@"%.2f", self.price];
    NSString *endChar = [priceStr substringWithRange:NSMakeRange(priceStr.length-1, 1)];
    if ([endChar isEqualToString:@"0"]) {
        priceStr = [priceStr substringWithRange:NSMakeRange(0, priceStr.length-1)];
    }
    if (self.point<=0 || (self.shouldShowPriceEvenIfZero || (!self.shouldShowPriceEvenIfZero && self.price>0))) {
        self.headString = @"¥";
        int i;
        for (i=0; i<priceStr.length; i++) {
            NSString *subStr = [priceStr substringWithRange:NSMakeRange(i, 1)];
            if ([subStr isEqualToString:@"."]) {
                self.integerString = [priceStr substringWithRange:NSMakeRange(0, i)];
                self.decimalString = [priceStr substringWithRange:NSMakeRange(i, priceStr.length-i)];
                break;
            }
        }
    } else {
        self.headString = nil;
        self.integerString = nil;
        self.decimalString = nil;
    }
    
    //是否显示的下
    double pointNumLength = [self.pointNum sizeWithAttributes:@{NSFontAttributeName:aFont}].width;
    double pointStrLength = [self.pointString sizeWithAttributes:@{NSFontAttributeName:bFont}].width;
    double addStrLength = [self.addString sizeWithAttributes:@{NSFontAttributeName:bFont}].width;
    double headLength = [self.headString sizeWithAttributes:@{NSFontAttributeName:bFont}].width;
    double integerLength = [self.integerString sizeWithAttributes:@{NSFontAttributeName:aFont}].width;
    double decimalLength = [self.decimalString sizeWithAttributes:@{NSFontAttributeName:bFont}].width;
    self.strLenth = pointNumLength + pointStrLength + addStrLength + headLength + integerLength + decimalLength + 2;
    
    CGRect rect = self.frame;
    float width = rect.size.width;
    //宽度为0时做默认处理
    if (-0.0001 < width && width < 0.0001) {
        rect.size.width = self.strLenth;
        self.frame = rect;
    }
    if (self.strLenth > self.frame.size.width) {//显示不下改变font
        self.strLenth = self.frame.size.width;
        self.startXValue = 0.0;
        //都变成bFont后比较
        double theLength = [self.pointNum sizeWithAttributes:@{NSFontAttributeName:bFont}].width + [self.pointString sizeWithAttributes:@{NSFontAttributeName:bFont}].width + [self.addString sizeWithAttributes:@{NSFontAttributeName:bFont}].width + [self.headString sizeWithAttributes:@{NSFontAttributeName:bFont}].width + [self.integerString sizeWithAttributes:@{NSFontAttributeName:bFont}].width + [self.decimalString sizeWithAttributes:@{NSFontAttributeName:bFont}].width + 2;
        if (theLength > self.frame.size.width) {//都变成bFont仍然显示不下
            double scale = self.frame.size.width / theLength;
            self.integerFont = [UIFont boldSystemFontOfSize:bFont.pointSize * scale];
            self.decimalFont = [UIFont boldSystemFontOfSize:bFont.pointSize * scale];
        } else {//都变成bFont可以显示下
            double scale = (self.frame.size.width - pointStrLength - addStrLength - headLength - decimalLength - 2) / (pointNumLength + integerLength);
            self.integerFont = [UIFont boldSystemFontOfSize:aFont.pointSize * scale];
            //改变小数部分font
            if (self.integerFont.pointSize < self.decimalFont.pointSize) {
                self.decimalFont = [UIFont boldSystemFontOfSize:self.integerFont.pointSize];
            }
        }
    } else {//显示的下，确定起始x值
        self.startXValue = 0.0;
        if (self.alignment == OTSPriceTextAlignmentCenter) {
            self.startXValue = (self.frame.size.width - pointNumLength - pointStrLength - addStrLength - headLength - integerLength - decimalLength - 2) / 2;
        } else if (self.alignment == OTSPriceTextAlignmentRight) {
            self.startXValue = self.frame.size.width - pointNumLength - pointStrLength - addStrLength - headLength - integerLength - decimalLength - 2;
        }
    }
    [self setNeedsDisplay];
}

- (void)updateWithPrice:(double)aPrice color:(UIColor *)aColor integerFont:(UIFont *)aFont decimalFont:(UIFont *)bFont
{
    [self updateWithPrice:aPrice
                    color:aColor
              integerFont:aFont
              decimalFont:bFont
                isCrossed:NO];
}

- (void)updateWithPrice:(double)aPrice
                  color:(UIColor *)aColor
            integerFont:(UIFont *)aFont
            decimalFont:(UIFont *)bFont
              isCrossed:(BOOL)aIsCrossed
{
    self.isCrossed = aIsCrossed;
    [self updateWithPrice:aPrice point:0 color:aColor integerFont:aFont decimalFont:bFont];
}

- (void)updateWithPrice:(double)aPrice point:(int)aPoint color:(UIColor *)aColor integerFont:(UIFont *)aFont decimalFont:(UIFont *)bFont firstShowPrice:(BOOL)aFirstShowPrice
{
    self.firstShowPrice = aFirstShowPrice;
    [self updateWithPrice:aPrice point:aPoint color:aColor integerFont:aFont decimalFont:bFont];
}

/**
 *  功能:返回内容的长度,为了团购首页中新加了省钱，要紧跟在价格后面要用到
 */
- (CGFloat)getMyStrLength
{
    return self.strLenth;
}

- (void)crossed
{
    self.isCrossed = YES;
    [self setNeedsDisplay];
}
@end
