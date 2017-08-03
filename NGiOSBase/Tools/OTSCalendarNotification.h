//
//  OTSCalendarNotification.h
//  OneStoreBase
//
//  Created by HUI on 16/6/30.
//  Copyright © 2016年 OneStoreBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

typedef void(^OTSCalendarNotifCompletionBlock)(NSError* anError);

@interface OTSCalendarNotification : NSObject

/*
 *创建一条日历提醒
 */
+ (void)creatCalendarNotificationWithStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                 remindContent:(NSString *)remindContent
                                    eventStore:(EKEventStore *)eventStore
                               completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock;

/*
 *创建一条日历提醒
 */
+ (void)creatCalendarNotificationWithStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                 remindContent:(NSString *)remindContent
                                     routerUrl:(NSString *)routerUrl
                                    eventStore:(EKEventStore *)eventStore
                               completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock;

/*
 *日历提醒是否存在
 */
+ (BOOL)isExistCalendarNotificationWithRouterUrl:(NSString *)routerUrl
                                       startTime:(NSDate *)startTime
                                      eventStore:(EKEventStore *)eventStore;

/*
 *日历提醒是否存在
 */
+ (BOOL)isExistCalendarNotificationWithStartDate:(NSDate *)startDate
                                      eventStore:(EKEventStore *)eventStore
                                   remindContent:(NSString *)remindContent;

/*
 *取消日历提醒
 */
+ (void)cancelCalendarNotificationWithRouterUrl:(NSString *)routerUrl
                                     eventStore:(EKEventStore *)eventStore
                                completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock;

/*
 *取消日历提醒
 */
+ (void)cancelCalendarNotificationWithStartDate:(NSDate *)startDate
                                     eventStore:(EKEventStore *)eventStore
                                  remindContent:(NSString *)remindContent
                                completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock;

@end
