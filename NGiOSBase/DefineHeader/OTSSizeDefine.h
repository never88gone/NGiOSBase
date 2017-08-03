//
//  OTSSizeDefine.h
//  OneStoreFramework
//
//  Created by Aimy on 14-6-23.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSFuncDefine.h"

//横竖屏宽度
#define UI_CURRENT_SCREEN_HEIGHT (IS_LANDSCAPE?(IOS_SDK_LESS_THAN(8.0)?([[UIScreen mainScreen] bounds].size.width):([[UIScreen mainScreen] bounds].size.height)):([[UIScreen mainScreen] bounds].size.height))

#define UI_CURRENT_SCREEN_WIDTH (IS_LANDSCAPE?\
(IOS_SDK_LESS_THAN(8.0)?([[UIScreen mainScreen] bounds].size.height):([[UIScreen mainScreen] bounds].size.width))\
:([[UIScreen mainScreen] bounds].size.width))