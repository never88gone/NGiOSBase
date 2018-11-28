//
//  OTSSwitch.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OTSSwitch;

typedef void(^OTSSwitchBlock)(OTSSwitch *otsSwitch, BOOL isOn);

@interface OTSSwitch : UISwitch

@property (nonatomic, strong) id data;

+ (instancetype)switchWithChangeValueBlock:(OTSSwitchBlock)aBlock;

@end
