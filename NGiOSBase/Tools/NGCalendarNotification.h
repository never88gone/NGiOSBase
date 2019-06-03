//
//  NGCalendarNotification.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

typedef void(^NGCalendarNotifCompletionBlock)(NSError* anError);

@interface NGCalendarNotification : NSObject

/*
 *创建一条日历提醒
 */
+ (void)creatCalendarNotificationWithStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                 remindContent:(NSString *)remindContent
                                    eventStore:(EKEventStore *)eventStore
                               completionBlock:(NGCalendarNotifCompletionBlock)aCompletionBlock;

/*
 *创建一条日历提醒
 */
+ (void)creatCalendarNotificationWithStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                 remindContent:(NSString *)remindContent
                                     routerUrl:(NSString *)routerUrl
                                    eventStore:(EKEventStore *)eventStore
                               completionBlock:(NGCalendarNotifCompletionBlock)aCompletionBlock;

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
                                completionBlock:(NGCalendarNotifCompletionBlock)aCompletionBlock;

/*
 *取消日历提醒
 */
+ (void)cancelCalendarNotificationWithStartDate:(NSDate *)startDate
                                     eventStore:(EKEventStore *)eventStore
                                  remindContent:(NSString *)remindContent
                                completionBlock:(NGCalendarNotifCompletionBlock)aCompletionBlock;

@end
