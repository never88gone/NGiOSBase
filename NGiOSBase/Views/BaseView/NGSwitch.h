//
//  NGSwitch.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NGSwitch;

typedef void(^NGSwitchBlock)(NGSwitch *NGSwitch, BOOL isOn);

@interface NGSwitch : UISwitch

@property (nonatomic, strong) id data;

+ (instancetype)switchWithChangeValueBlock:(NGSwitchBlock)aBlock;

@end
