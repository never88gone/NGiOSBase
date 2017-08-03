//
//  NSObject+safe.m
//  OneStoreFramework
//
//  Created by Aimy on 14/11/26.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "NSObject+safe.h"

#import "NSObject+swizzle.h"
#import "OTSLog.h"

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
        OTSLogE(@"%@,isnan of x",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.origin.y)) {
        OTSLogE(@"%@,isnan of y",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.size.width)) {
        OTSLogE(@"%@,isnan of w",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
    if (isnan(frame.size.height)) {
        OTSLogE(@"%@,isnan of h",self);
        [self safeSetFrame:CGRectZero];
        return;
    }
    
//    if (isinf(frame.origin.x)) {
//        OTSLogE(@"%@,isinf of x",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
//    
//    if (isinf(frame.origin.y)) {
//        OTSLogE(@"%@,isinf of y",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
//    
//    if (isinf(frame.size.width)) {
//        OTSLogE(@"%@,isinf of w",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
//    
//    if (isinf(frame.size.height)) {
//        OTSLogE(@"%@,isinf of h",self);
//        [self safeSetFrame:CGRectZero];
//        return;
//    }
    
    [self safeSetFrame:frame];
}

@end