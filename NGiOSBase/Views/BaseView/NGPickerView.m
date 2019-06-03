//
//  NGPickerView.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGPickerView.h"
//category
#import "NSObject+BeeNotification.h"

@implementation NGPickerView

- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated
{    
    NSInteger rowCount = [self numberOfRowsInComponent:component];
    if (row>=0 && row<=rowCount-1) {
        [super selectRow:row inComponent:component animated:animated];
    }
    else {
        [super selectRow:0 inComponent:component animated:animated];
    }
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
