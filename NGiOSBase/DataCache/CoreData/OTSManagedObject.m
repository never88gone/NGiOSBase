//
//  OTSManagedObject.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSManagedObject.h"
#import "OTSCoreDataManager.h"
//category
#import "NSObject+BeeNotification.h"

@implementation OTSManagedObject

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
