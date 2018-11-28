//
//  UIView+Masker.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UIView+Maker.h"
#import "UIView+create.h"

@implementation UIView(Maker)

+ (instancetype)makeAutoLayoutView:(void(^)(OTSViewMaker *maker))block
{
    if (![[self class] isSubclassOfClass:[UIView class]]) {
        return nil;
    }
    return [self makeAutoLayoutView:block
                      withViewClass:[UIView class]
                     withMakerClass:[OTSViewMaker class]];
}

+ (instancetype)makeAutoLayoutView:(void(^)(OTSViewMaker *))block
                          withViewClass:(Class )viewClass
                         withMakerClass:(Class )makerClass
{
    if (![viewClass isSubclassOfClass:[self class]]
        || ![makerClass isSubclassOfClass:[OTSViewMaker class]]) {
        return nil;
    }
    UIView *view = [viewClass autolayoutView];
    OTSViewMaker *maker = [[makerClass alloc] initWithView:view];
    maker.isAutoLayout = YES;
    if (block) {
        block(maker);
        [maker install];
        [view sizeToFit];
    }
    return view;
}

+ (instancetype)makeAutoLayoutLabel:(void(^)(OTSUILabelMaker* labelMaker))block
{
    if (![[self class] isSubclassOfClass:[UILabel class]]) {
        return nil;
    }
    return [self makeAutoLayoutView:(void(^)(OTSViewMaker *))block
                      withViewClass:[self class]
                     withMakerClass:[OTSUILabelMaker class]];
}

+ (instancetype)makeAutoLayoutButton:(void(^)(OTSUIButtonMaker* buttonMaker))block
{
    if (![[self class] isSubclassOfClass:[UIButton class]]) {
        return nil;
    }
    return [self makeAutoLayoutView:(void(^)(OTSViewMaker *))block
                      withViewClass:[self class]
                     withMakerClass:[OTSUIButtonMaker class]];
}
@end
