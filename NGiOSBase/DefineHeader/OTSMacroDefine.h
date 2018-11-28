//
//  OTSMacroDefine.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//


#define STRINGIFY(S) #S
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
#define FORMATTED_MESSAGE(TYPE, MSG)  "//"#TYPE ": " MSG " \n" \
DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)

#define TODO(MSG) PRAGMA_MESSAGE(FORMATTED_MESSAGE(TODO,MSG))

#define FIXME(MSG) PRAGMA_MESSAGE(FORMATTED_MESSAGE(FIXME,MSG))

#define SHARED_APP_DELEGATE (OTSAppDelegate *)[UIApplication sharedApplication].delegate
#define SHARED_APP_TOP_WINDOW ([UIApplication sharedApplication].keyWindow)
#define SHARED_APP_KEY_WINDOW_ROOT_VIEW ([UIApplication sharedApplication].keyWindow.rootViewController.view)

#define OTS_PROPERTY(...) @property(nonatomic, ##__VA_ARGS__)
#define OTS_PROPERTY_STRONG OTS_PROPERTY(strong)
#define OTS_PROPERTY_ASSIGN OTS_PROPERTY(assign)
#define OTS_PROPERTY_WEAK   OTS_PROPERTY(weak)
#define OTS_PROPERTY_COPY   OTS_PROPERTY(copy)

