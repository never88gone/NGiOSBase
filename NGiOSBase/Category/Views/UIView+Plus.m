//
//  UIView+Plus.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UIView+Plus.h"
#import "MBProgressHUD.h"
#import "NSMutableArray+safe.h"

@implementation UIView (Plus)

- (void)resignAllResonders
{
    for (UIView *sub in self.subviews)
    {
        [sub resignFirstResponder];
        [sub resignAllResonders];
    }
}

-(void)removeAllSubsWithClass:(Class)aClass
{
    for (UIView *sub in self.subviews)
    {
        if (aClass)
        {
            if ([sub isKindOfClass:aClass])
            {
                [sub removeFromSuperview];
            }
        }
        else
        {
            [sub removeFromSuperview];
        }
    }
}

- (NSArray *)subViewsWithClass:(Class)aClass
{
	NSMutableArray *subViewArray = [[NSMutableArray alloc] init];
	for (UIView *subview in self.subviews) {
		if ([subview isKindOfClass:aClass]) {
			[subViewArray safeAddObject:subview];
		}
	}
	if (subViewArray.count <= 0) {
		subViewArray = nil;
	}
	return subViewArray;
}

- (void)showLoadingWithMessage:(NSString *)aMessage
{
	MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.detailsLabel.text = aMessage;
}

- (void)hideLoading
{
	[MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showToastWithTitle:(NSString *)title titleFont:(UIFont *)titleFont message:(NSString *)message messageFont:(UIFont *)messageFont duration:(CGFloat)duration {
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    hud.mode = MBProgressHUDModeText;
    hud.label.text  = title;
    hud.label.font = titleFont;
    hud.detailsLabel.font = messageFont;
    hud.detailsLabel.text  = message;
    [self addSubview:hud];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:duration];
}
@end
