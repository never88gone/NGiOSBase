//
//  OTSWindow.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSWindow.h"

#import "NSObject+BeeNotification.h"

@implementation OTSWindow

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [super motionEnded:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [self postNotification:OTS_NOTIFICATION_SHAKE];
    }
}

@end
 
