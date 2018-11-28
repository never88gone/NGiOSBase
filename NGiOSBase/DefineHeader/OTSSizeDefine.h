//
//  OTSSizeDefine.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSFuncDefine.h"

//横竖屏宽度
#define UI_CURRENT_SCREEN_HEIGHT (IS_LANDSCAPE?(IOS_SDK_LESS_THAN(8.0)?([[UIScreen mainScreen] bounds].size.width):([[UIScreen mainScreen] bounds].size.height)):([[UIScreen mainScreen] bounds].size.height))

#define UI_CURRENT_SCREEN_WIDTH (IS_LANDSCAPE?\
(IOS_SDK_LESS_THAN(8.0)?([[UIScreen mainScreen] bounds].size.height):([[UIScreen mainScreen] bounds].size.width))\
:([[UIScreen mainScreen] bounds].size.width))
