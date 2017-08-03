//
//  PhoneDailyDealsLimitTimeCountDownView.h
//  OneStoreMain
//
//  Created by airspuer on 14-9-16.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

/**
 *	到计时结束后发送的通知名称
 */
UIKIT_EXTERN NSString * const OTSProductCountDownViewTimeEndNotificationName;

#import "OTSView.h"

@interface OTSProductCountDownView :OTSView

/**
 *	创建倒计时视图.只可以使用此方法创建视图。。创建时已经设好了bounds.
 *
 *	@return
 */
+ (OTSProductCountDownView *)createView;

/**
 *	显示当前时间[NSDate date] 到aEndDate之间的倒计时
 *
 *	@param aDate。倒计时截至时期。aEndDate比当前时间早就不显示
 */

- (void)setupWithEndDate:(NSDate*)aEndDate;

@end
