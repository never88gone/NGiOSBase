//
//  OTSNonModelLoadingView.h
//  OneStore
//
//  Created by airspuer on 14-4-14.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSView.h"

@interface OTSNonModelLoadingView : OTSView

+ (instancetype)showLoadingAddedTo:(UIView *)view animated:(BOOL)animated;

+ (void)hideLoadingForView:(UIView *)view animated:(BOOL)animated;

@end
