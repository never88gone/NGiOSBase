//
//  NGSwitch.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGSwitch.h"
//category
#import "NSObject+BeeNotification.h"

@interface NGSwitch ()

@property (nonatomic, copy) NGSwitchBlock block;

@end

@implementation NGSwitch

- (void)changeValue
{
    if (self.block) {
        self.block(self,self.isOn);
    }
}

+ (instancetype)switchWithChangeValueBlock:(NGSwitchBlock)aBlock
{
    NGSwitch *NGSwitch = [[self alloc] initWithFrame:CGRectZero];
    [NGSwitch addTarget:NGSwitch action:@selector(changeValue) forControlEvents:UIControlEventValueChanged];
    NGSwitch.block = aBlock;
    return NGSwitch;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
