//
//  UIViewController+loading.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UIViewController+loading.h"

#import "MBProgressHUD.h"

#import "NGNonModelLoadingView.h"

@implementation UIViewController (loading)

#pragma mark - loading

- (void)showLoading
{
    [self showLoadingWithMessage:nil];
}

- (void)showLoadingWithMessage:(NSString *)message
{
    [self showLoadingWithMessage:message hideAfter:0];
}

- (void)showLoadingWithMessage:(NSString *)message hideAfter:(NSTimeInterval)second
{
    [self showLoadingWithMessage:message onView:self.view hideAfter:second];
}

- (void)showLoadingWithMessage:(NSString *)message onView:(UIView *)aView hideAfter:(NSTimeInterval)second
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:aView animated:YES];
    
    if (message) {
        hud.detailsLabel.text = message;
        hud.detailsLabel.font = [UIFont systemFontOfSize:12];
        hud.mode = MBProgressHUDModeText;
    }
    else {
        hud.mode = MBProgressHUDModeIndeterminate;
    }
    
    if (second > 0) {
        [hud hideAnimated:YES afterDelay:second];
    }
}

- (void)hideLoading
{
    [self hideLoadingOnView:self.view];
}

- (void)hideLoadingOnView:(UIView *)aView
{
    [MBProgressHUD hideHUDForView:aView animated:YES];
}

- (void)showNonModelLoading
{
    [NGNonModelLoadingView showLoadingAddedTo:self.view animated:YES];
}

- (void)hideNonModelLoading
{
    [NGNonModelLoadingView hideLoadingForView:self.view animated:YES];
}

@end
