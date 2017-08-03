//
//  PhoneDailyDealsLimitTimeCountDownView.m
//  OneStoreMain
//
//  Created by airspuer on 14-9-16.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSProductCountDownView.h"
//define
#import "OTSFuncDefine.h"
//tool
#import "OTSDeadtimeTimer.h"
//category
#import "NSObject+BeeNotification.h"

 NSString * const OTSProductCountDownViewTimeEndNotificationName = @"OTSProductCountDownViewTimeEndNotificationName";

@interface OTSProductCountDownView()

@property (weak, nonatomic) IBOutlet UIButton *hourTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *minuteTimeButton;
@property (weak, nonatomic) IBOutlet UIButton *secondTimeButton;

@property (nonatomic, strong) OTSDeadtimeTimer *activityTimer;

@end

@implementation OTSProductCountDownView

+ (OTSProductCountDownView *)createView
{
	return [OTSProductCountDownView createWithNibName:NSStringFromClass([self class])];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.activityTimer = [OTSDeadtimeTimer new];
}

- (void)setupWithEndDate:(NSDate*)aEndDate
{
    WEAK_SELF;
	[self.activityTimer runWithDeadtime:aEndDate andBLock:^(NSDateComponents *dateComponents) {
        STRONG_SELF;
        if (([dateComponents hour] + [dateComponents minute] + [dateComponents second]) <= 0) {
            [self postNotification:OTSProductCountDownViewTimeEndNotificationName];
        }
        
        [self updateViewWithDateTime:dateComponents];
    }];
}

- (void)updateViewWithDateTime:(NSDateComponents*)dateTime
{
	if (!dateTime) {
		return;
	}
	NSInteger hour = dateTime.hour;
	if (hour < 0) {
		hour = 0;
	}
	[self.hourTimeButton setTitle:[NSString stringWithFormat:@"%02ld",(long)hour] forState:UIControlStateNormal];

	NSInteger minute = dateTime.minute;
	if (minute < 0) {
		minute = 0;
	}
	[self.minuteTimeButton setTitle:[NSString stringWithFormat:@"%02ld",(long)minute] forState:UIControlStateNormal];

	NSInteger second = dateTime.second;
	if (second < 0) {
		second = 0;
	}

	[self.secondTimeButton setTitle:[NSString stringWithFormat:@"%02ld",(long)second] forState:UIControlStateNormal];
}

- (CGSize)intrinsicContentSize
{
	return self.frame.size;
}

- (void)dealloc
{
    [self.activityTimer stop];
}

@end
