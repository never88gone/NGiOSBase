//
//  NGManagedObject.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGManagedObject.h"
#import "NGCoreDataManager.h"
//category
#import "NSObject+BeeNotification.h"

@implementation NGManagedObject

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
