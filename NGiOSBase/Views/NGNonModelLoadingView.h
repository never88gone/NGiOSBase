//
//  NGNonModelLoadingView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGView.h"

@interface NGNonModelLoadingView : NGView

+ (instancetype)showLoadingAddedTo:(UIView *)view animated:(BOOL)animated;

+ (void)hideLoadingForView:(UIView *)view animated:(BOOL)animated;

@end
