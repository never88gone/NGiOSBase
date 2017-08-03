//
//  OTSEnhanceAlterView.h
//  OneStoreFramework
//
//  Created by ChaiJun on 15/8/31.
//  Copyright (c) 2015年 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Sizes.h"
#import "SWCommonMacro.h"
#import "OTSEnhanceAlertViewDelegate.h"

@interface OTSEnhanceAlterView : UIView

- (instancetype)initWithTitle:(NSAttributedString *)title
                      message:(NSAttributedString *)message
                     delegate:(id /*<OTSEnhanceAlertHUDDelegate>*/)delegate
                       titles:(NSArray *)titles;
@end
