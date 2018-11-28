//
//  OTSSwitch.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
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
