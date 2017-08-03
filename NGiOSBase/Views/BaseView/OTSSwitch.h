//
//  OTSSwitch.h
//  OneStoreFramework
//
//  Created by Aimy on 14-8-18.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OTSSwitch;

typedef void(^OTSSwitchBlock)(OTSSwitch *otsSwitch, BOOL isOn);

@interface OTSSwitch : UISwitch

@property (nonatomic, strong) id data;

+ (instancetype)switchWithChangeValueBlock:(OTSSwitchBlock)aBlock;

@end
