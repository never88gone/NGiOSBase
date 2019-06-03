//
//  UIView+Masker.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UIView+Maker.h"
#import "UIView+create.h"

@implementation UIView(Maker)

+ (instancetype)makeAutoLayoutView:(void(^)(NGViewMaker *maker))block
{
    if (![[self class] isSubclassOfClass:[UIView class]]) {
        return nil;
    }
    return [self makeAutoLayoutView:block
                      withViewClass:[UIView class]
                     withMakerClass:[NGViewMaker class]];
}

+ (instancetype)makeAutoLayoutView:(void(^)(NGViewMaker *))block
                          withViewClass:(Class )viewClass
                         withMakerClass:(Class )makerClass
{
    if (![viewClass isSubclassOfClass:[self class]]
        || ![makerClass isSubclassOfClass:[NGViewMaker class]]) {
        return nil;
    }
    UIView *view = [viewClass autolayoutView];
    NGViewMaker *maker = [[makerClass alloc] initWithView:view];
    maker.isAutoLayout = YES;
    if (block) {
        block(maker);
        [maker install];
        [view sizeToFit];
    }
    return view;
}

+ (instancetype)makeAutoLayoutLabel:(void(^)(NGUILabelMaker* labelMaker))block
{
    if (![[self class] isSubclassOfClass:[UILabel class]]) {
        return nil;
    }
    return [self makeAutoLayoutView:(void(^)(NGViewMaker *))block
                      withViewClass:[self class]
                     withMakerClass:[NGUILabelMaker class]];
}

+ (instancetype)makeAutoLayoutButton:(void(^)(NGUIButtonMaker* buttonMaker))block
{
    if (![[self class] isSubclassOfClass:[UIButton class]]) {
        return nil;
    }
    return [self makeAutoLayoutView:(void(^)(NGViewMaker *))block
                      withViewClass:[self class]
                     withMakerClass:[NGUIButtonMaker class]];
}
@end
