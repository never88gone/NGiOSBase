//
//  OTSCrossedOutLabel.m
//  OneStore
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSCrossedOutLabel.h"

@interface OTSCrossedOutLabel ()
@property(nonatomic, strong)UIColor *mColor;
@end

@implementation OTSCrossedOutLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)setTextColor:(UIColor *)textColor {
    self.mColor = textColor;
    [super setTextColor:textColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
//	CGContextSetRGBStrokeColor(context, 0.667, 0.667, 0.667, 1.0);
	CGContextSetLineWidth(context, 1.0);
    if (_mColor) {
        [_mColor set];
    }
	
	// Draw a single line from left to right
//    CGFloat width = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}].width;
//    CGFloat xValue = 0.0;
//    if (self.textAlignment == NSTextAlignmentCenter) {
//        xValue = (self.frame.size.width - width) / 2;
//    } else if (self.textAlignment == NSTextAlignmentRight) {
//        xValue = self.frame.size.width - width;
//    }
//	CGContextMoveToPoint(context, xValue, self.frame.size.height / 2);
//	CGContextAddLineToPoint(context, xValue + width, [self frame].size.height / 2);
//	CGContextStrokePath(context);
}

@end
