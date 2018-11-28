//
//  OTSDeadtimeTimer.h
//  OneStoreMain
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  为nil则表示已经倒计时完成了
 *
 *  @param dateComponents 
 */
typedef void(^OTSDeadtimeTimerBlock)(NSDateComponents *dateComponents);

@interface OTSDeadtimeTimer : NSObject

- (void)runWithDeadtime:(NSDate *)deadtime andBLock:(OTSDeadtimeTimerBlock)aBlock;
- (void)stop;

@end
