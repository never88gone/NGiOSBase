//
//  OTSSwitch.m
//  OneStoreFramework
//
//  Created by Aimy on 14-8-18.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSSwitch.h"
//category
#import "NSObject+BeeNotification.h"

@interface OTSSwitch ()

@property (nonatomic, copy) OTSSwitchBlock block;

@end

@implementation OTSSwitch

- (void)changeValue
{
    if (self.block) {
        self.block(self,self.isOn);
    }
}

+ (instancetype)switchWithChangeValueBlock:(OTSSwitchBlock)aBlock
{
    OTSSwitch *otsSwitch = [[self alloc] initWithFrame:CGRectZero];
    [otsSwitch addTarget:otsSwitch action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];
    otsSwitch.block = aBlock;
    return otsSwitch;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
