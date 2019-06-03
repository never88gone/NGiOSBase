//
//  NGLog.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <CocoaLumberjack/CocoaLumberjack.h>
#import "NGMacroDefine.h"

//新增log level用作log日志
#define LOG_FLAG_DATA_TO_FILE     (1 << 5)  // 0...100000
#define DDLogDataToFile(frmt, ...) LOG_MAYBE(NO, LOG_LEVEL_DEF, LOG_FLAG_DATA_TO_FILE, 0, nil, __PRETTY_FUNCTION__, frmt, ##__VA_ARGS__)

#ifdef DEBUG

static const int ddLogLevel = (DDLogLevelVerbose | LOG_FLAG_DATA_TO_FILE);

#define NSLog(...) NSLog(__VA_ARGS__)

#else

static const DDLogLevel ddLogLevel = DDLogLevelOff;
//干掉log
#define NSLog(...) {}
//干掉断言
#define NS_BLOCK_ASSERTIONS

#endif

#define NGLogV(frmt, ...) DDLogVerbose(frmt, ##__VA_ARGS__)

#define NGLogD(frmt, ...) DDLogDebug(frmt, ##__VA_ARGS__)

#define NGLogI(frmt, ...) DDLogInfo(frmt, ##__VA_ARGS__)

#define NGLogW(frmt, ...) DDLogWarn(frmt, ##__VA_ARGS__)

#define NGLogE(frmt, ...) DDLogError(frmt, ##__VA_ARGS__)

#define NGLogF(frmt, ...) DDLogDataToFile(frmt, ##__VA_ARGS__) //log日志专用

//log
#define LOG_PRETTY_FUNCTION NGLogV(@"%s", __PRETTY_FUNCTION__)
#define LOG_LINE_PRETTY_FUNCTION NGLogV(@"line[%d] %s", __LINE__, __PRETTY_FUNCTION__)

//func log
#define NGLogFuncV NGLogV(@"[%@ call %@]", [self class], THIS_METHOD)
#define NGLogFuncD NGLogD(@"[%@ call %@]", [self class], THIS_METHOD)
#define NGLogFuncI NGLogI(@"[%@ call %@]", [self class], THIS_METHOD)
#define NGLogFuncW NGLogW(@"[%@ call %@]", [self class], THIS_METHOD)
#define NGLogFuncE NGLogE(@"[%@ call %@]", [self class], THIS_METHOD)

@interface NGLog : NSObject

+ (void)setupLogerStatus;

@end

