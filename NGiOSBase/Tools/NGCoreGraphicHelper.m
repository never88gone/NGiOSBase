//
//  NGCoreGraphicHelper.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGCoreGraphicHelper.h"
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/UIImageView+WebCache.h>

//背景色
const NSString *kNGBackgroundColorAttributeName = @"NGBackgroundColorAttributeName";
//背景色区域与字区域的便宜，相当于大了多少
const NSString *kNGBackgroundOffsetAttributeName = @"NGBackgroundOffsetAttributeName";
//背景色区域高度
const NSString *kNGBackgroundHeightbuteName = @"NGBackgroundHeightbuteName";
//圆角类型
const NSString *kNGBackgroundCornerTypeAttributeName = @"NGBackgroundCornerTypeAttributeName";
//圆角大小
const NSString *kNGBackgroundCornerRadiusAttributeName = @"NGBackgroundCornerRadiusAttributeName";

//框的宽度
const NSString *kNGBorderWidthAttributeName = @"NGBorderWidthAttributeName";
//背景色区域与字区域的便宜，相当于大了多少
const NSString *kNGBorderOffsetAttributeName = @"NGBorderOffsetAttributeName";
//框的颜色
const NSString *kNGBorderColorAttributeName = @"NGBorderColorAttributeName";
//框的圆角大小
const NSString *kNGBorderCornerRadiusAttributeName = @"NGBorderCornerRadiusAttributeName";

//占位大小
const NSString *kNGPlaceholderRectAttributeName = @"NGPlaceholderSizeAttributeName";
//占位图片
const NSString *kNGPlaceholderImageAttributeName = @"NGPlaceholderImageAttributeName";

CGFloat ascentCallback (void * refCon)
{
    NSValue *value = (__bridge NSValue *)(refCon);
    return value.CGRectValue.size.height / 2;
}

CGFloat descentCallback (void * refCon)
{
    NSValue *value = (__bridge NSValue *)(refCon);
    return value.CGRectValue.size.height / 2;
}

CGFloat widthCallback (void * refCon)
{
    NSValue *value = (__bridge NSValue *)(refCon);
    return value.CGRectValue.size.width;
}

void deallocCallback (void * refCon)
{
    CFRelease(refCon);
}

@implementation NGCoreGraphicHelper

+ (void)drawAttributedString:(NSAttributedString *)attributedString inDrawRect:(CGRect)drawRect inTextRect:(CGRect)textRect context:(CGContextRef)c {
    if (!attributedString) {
        return ;
    }

    CGContextSaveGState(c);

    CGContextTranslateCTM(c, drawRect.origin.x, drawRect.size.height - textRect.origin.y - textRect.size.height);

    NSAttributedString *tempAttributedString = attributedString.copy;

    //framesetter
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge_retained CFAttributedStringRef)tempAttributedString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, textRect);

    //frame
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, tempAttributedString.length), path, NULL);

    //line origins
    CFArrayRef lines = CTFrameGetLines(frame);
    NSInteger numberOfLines = CFArrayGetCount(lines);
    CGPoint lineOrigins[numberOfLines];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, numberOfLines), lineOrigins);

    for (CFIndex lineIndex = 0; lineIndex < numberOfLines; lineIndex++) {
        CGPoint lineOrigin = lineOrigins[lineIndex];
        lineOrigin = CGPointMake(ceil(lineOrigin.x), ceil(lineOrigin.y));

        //line
        CTLineRef line = CFArrayGetValueAtIndex(lines, lineIndex);
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        NSInteger numberOfRuns = CFArrayGetCount(runs);

        for (CFIndex runIndex = 0; runIndex < numberOfRuns; runIndex++) {
            //run
            CTRunRef run = CFArrayGetValueAtIndex(runs, runIndex);

            CGFloat ascent;
            CGFloat descent;
            CGFloat leading;

            CGFloat width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, &leading);
            CGFloat height = ascent + descent;

            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
            CGFloat x = lineOrigin.x + xOffset;
            CGFloat y = lineOrigin.y - descent;

            __unused CGRect runRect = CGRectMake(x, y, width, height);

            NSDictionary *attributes = (NSDictionary *)CTRunGetAttributes(run);

            NSNumber *backgroundoffset = [attributes objectForKey:kNGBackgroundOffsetAttributeName];
            UIColor *backgroundColor = [attributes objectForKey:kNGBackgroundColorAttributeName];
            UIRectCorner cornerType = [[attributes objectForKey:kNGBackgroundCornerTypeAttributeName] unsignedIntegerValue];
            NSNumber *backgroundRadius = [attributes objectForKey:kNGBackgroundCornerRadiusAttributeName];
            NSNumber *backgroundHeight = [attributes objectForKey:kNGBackgroundHeightbuteName];

            if (backgroundColor) {
                CGContextSaveGState(c);
                CGRect backgroundRect = CGRectMake(x, lineOrigin.y - backgroundoffset.floatValue, ceil(width), backgroundHeight ? backgroundHeight.floatValue: height);
                backgroundRect = CGRectInset(backgroundRect, -(0.25 * [UIScreen mainScreen].scale), 0);
                UIBezierPath *backgroundPath = [UIBezierPath bezierPathWithRoundedRect:backgroundRect byRoundingCorners:cornerType cornerRadii:CGSizeMake(backgroundRadius.floatValue, backgroundRadius.floatValue)];
                [backgroundColor setFill];
                [backgroundPath fill];
                CGContextRestoreGState(c);
            }

            NSNumber *borderoffset = [attributes objectForKey:kNGBorderOffsetAttributeName];
            UIColor *bordercolor = [attributes objectForKey:kNGBorderColorAttributeName];
            NSNumber *borderwidth = [attributes objectForKey:kNGBorderWidthAttributeName];
            NSNumber *boderRadius = [attributes objectForKey:kNGBorderCornerRadiusAttributeName];

            if (!borderwidth) {
                borderwidth = @1;
            }

            if (borderoffset.floatValue > 0) {
                CGContextSaveGState(c);

                CGRect borderRect = CGRectMake(x, y + borderoffset.floatValue, width, height);
                borderRect = CGRectInset(borderRect, -borderoffset.floatValue, -borderoffset.floatValue);

                UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:borderRect cornerRadius:boderRadius.floatValue];
                borderPath.lineWidth = borderwidth.floatValue;
                [bordercolor ?: [UIColor blackColor] set];
                [borderPath stroke];

                CGContextRestoreGState(c);
            }

            NSString *imageName = [attributes objectForKey:kNGPlaceholderImageAttributeName];
            NSValue *imageValue = [attributes objectForKey:kNGPlaceholderRectAttributeName];

            if (imageValue && imageName) {
                CGRect imageRect = imageValue.CGRectValue;
                imageRect = CGRectMake(lineOrigin.x + xOffset + imageRect.origin.x, lineOrigin.y + imageRect.origin.y, imageRect.size.width, imageRect.size.height);
                
                if ([imageName hasPrefix:@"http"]) {
                    UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imageName];
                    if (image) {
                        CGContextDrawImage(c, imageRect, image.CGImage);
                    } else {
                        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:imageName] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                            if (!error && finished) {
                                 CGContextDrawImage(c, imageRect, image.CGImage);
                            }
                        }];
                    }
                } else {
                    UIImage *image = [UIImage imageNamed:imageName];
                    CGContextDrawImage(c, imageRect, image.CGImage);
                }
            }
            else {
                CGContextSetTextPosition(c, lineOrigin.x, lineOrigin.y + borderoffset.floatValue);
                CTRunDraw(run, c, CFRangeMake(0, 0));
            }
        }
    }

    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
    CGContextRestoreGState(c);
}

@end

@implementation NSMutableAttributedString (NGCoreGraphicHelper)

- (NSMutableAttributedString *)stringByAppendingPlaceholerRect:(CGRect)rect placeholderImageName:(NSString *)imageName
{
    return [self stringByAppendingPlaceholerRect:rect placeholderImageName:imageName attributes:nil];
}

- (NSMutableAttributedString *)stringByAppendingPlaceholerRect:(CGRect)rect placeholderImageName:(NSString *)imageName attributes:(NSDictionary *)attributes
{
    NSMutableDictionary *params = @{kNGPlaceholderRectAttributeName: [NSValue valueWithCGRect:rect], kNGPlaceholderImageAttributeName: imageName}.mutableCopy;

    CTRunDelegateCallbacks callbacks;
    callbacks.version       = kCTRunDelegateVersion1;
    callbacks.getAscent     = ascentCallback;
    callbacks.getDescent    = descentCallback;
    callbacks.getWidth      = widthCallback;
    callbacks.dealloc       = deallocCallback;

    CTRunDelegateRef delegate = CTRunDelegateCreate(&callbacks, (void *)params[kNGPlaceholderRectAttributeName]);

    params[(NSString *)kCTRunDelegateAttributeName] = (__bridge id)delegate;
    [params setValuesForKeysWithDictionary:attributes];

    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@" " attributes:params];

    CFRelease(delegate);

    [self appendAttributedString:string];
    return self;
}

@end
