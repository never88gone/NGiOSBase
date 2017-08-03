//
//  OTSTopWindow.m
//  OneStoreBase
//
//  Created by Shawn on 2017/1/9.
//  Copyright © 2017年 OneStoreBase. All rights reserved.
//

#import "OTSTopWindow.h"

@implementation OTSTopWindow

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(_keyboradWillShow) name:UIKeyboardWillShowNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)_keyboradWillShow
{
    if (self.hidden == NO) {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    }
}

- (void)setHidden:(BOOL)hidden
{
    [super setHidden:hidden];
    if (hidden == NO) {
        [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    }
}

@end
