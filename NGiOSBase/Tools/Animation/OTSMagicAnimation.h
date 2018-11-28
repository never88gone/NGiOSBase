//
//  OTSMagicAnimation.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSVCAnimation.h"

@interface OTSMagicAnimation : OTSVCAnimation

@end

@interface UIViewController (OTSMagicAnimation)

//需要转换的view
- (NSArray *)animationViews;

@end
