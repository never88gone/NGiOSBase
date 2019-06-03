//
//  NGWindow.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGWindow.h"

#import "NSObject+BeeNotification.h"

@implementation NGWindow

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [super motionEnded:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [self postNotification:NG_NOTIFICATION_SHAKE];
    }
}

@end
 
