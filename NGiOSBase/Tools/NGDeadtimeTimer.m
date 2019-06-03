//
//  NGDeadtimeTimer.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGDeadtimeTimer.h"
//define
#import "NGFuncDefine.h"
//tool
#import "NGLog.h"
//#import "MSWeakTimer.h"
#import "NGGlobalValue.h"

@interface NGDeadtimeTimer ()

@property (nonatomic, copy) NGDeadtimeTimerBlock block;

@property (nonatomic, strong) NSTimer *countdownTimer;

@property (nonatomic, copy) NSDate *deadTime;

@end

@implementation NGDeadtimeTimer

- (void)runCountdownView
{
    NSDate *now = [NGGlobalValue sharedInstance].serverTime;
    if ([self.deadTime compare:now] == NSOrderedDescending) {
        NSTimeInterval timeInterval = [self.deadTime timeIntervalSinceDate:now];
        NSDate *endingDate = now;
        NSDate *startingDate = [endingDate dateByAddingTimeInterval:-timeInterval];
        
        NSCalendarUnit components = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
        NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:components fromDate:startingDate toDate:endingDate options:(NSCalendarOptions)0];
        
        if (self.block) {
            self.block(dateComponents);
        }
    } else {
        if (self.block) {
            self.block(nil);
        }
        _block = nil;
        [self stop];
    }
}

- (void)runWithDeadtime:(NSDate *)deadtime andBLock:(NGDeadtimeTimerBlock)aBlock
{
    self.block = aBlock;
    
    self.deadTime = deadtime;
    
    [self stop];
    
    WEAK_SELF;
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.f target:weakSelf selector:@selector(runCountdownView) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.countdownTimer forMode:NSRunLoopCommonModes];
    [self.countdownTimer fire];
}

- (void)stop
{
    [self.countdownTimer invalidate];
}

- (void)dealloc
{
    NGLogFuncW;
}

@end
