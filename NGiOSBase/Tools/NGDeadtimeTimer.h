//
//  NGDeadtimeTimer.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  为nil则表示已经倒计时完成了
 *
 *  @param dateComponents 时间格式
 */
typedef void(^NGDeadtimeTimerBlock)(NSDateComponents *dateComponents);

@interface NGDeadtimeTimer : NSObject

- (void)runWithDeadtime:(NSDate *)deadtime andBLock:(NGDeadtimeTimerBlock)aBlock;
- (void)stop;

@end
