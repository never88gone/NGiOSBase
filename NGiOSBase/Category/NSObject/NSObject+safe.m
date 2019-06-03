//
//  NSObject+safe.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NSObject+safe.h"

#import "NSObject+swizzle.h"
#import "NGLog.h"

@implementation NSObject (safe)

- (NSNumber *)toNumberIfNeeded
{
    if ([self isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)self;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterNoStyle;
        NSNumber *myNumber = [f numberFromString:(NSString *)self];
        return myNumber;
    }
    
    return nil;
}

@end

@implementation UIView (safe)

+ (void)load
{
    [self exchangeMethod:@selector(setFrame:) withMethod:@selector(safeSetFrame:)];
}

- (void)safeSetFrame:(CGRect)frame
{
    if (isnan(frame.origin.x)) {
        NGLogE(@"%@,isnan of x",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.origin.y)) {
        NGLogE(@"%@,isnan of y",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.size.width)) {
        NGLogE(@"%@,isnan of w",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.size.height)) {
        NGLogE(@"%@,isnan of h",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
//    if (isinf(frame.origin.x)) {
//        NGLogE(@"%@,isinf of x",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
//    
//    if (isinf(frame.origin.y)) {
//        NGLogE(@"%@,isinf of y",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
//    
//    if (isinf(frame.size.width)) {
//        NGLogE(@"%@,isinf of w",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
//    
//    if (isinf(frame.size.height)) {
//        NGLogE(@"%@,isinf of h",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
    
    [self safeSetFrame:frame];
}

@end
