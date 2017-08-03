//
//  OTSWindow.m
//  OneStoreFramework
//
//  Created by Aimy on 14-6-23.
//  Copyright (c) 2014年 OneStore. All rights reserved.
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
 