//
//  OTSCalendarNotification.m
//  OneStoreBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSCalendarNotification.h"
#import "OTSAlertView.h"

@implementation OTSCalendarNotification

+ (void)creatCalendarNotificationWithStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                 remindContent:(NSString *)remindContent
                                    eventStore:(EKEventStore *)eventStore
                               completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock {
    [self creatCalendarNotificationWithStartDate:startDate endDate:endDate remindContent:remindContent routerUrl:nil eventStore:eventStore completionBlock:aCompletionBlock];
}


+ (void)creatCalendarNotificationWithStartDate:(NSDate *)startDate
                                       endDate:(NSDate *)endDate
                                 remindContent:(NSString *)remindContent
                                     routerUrl:(NSString *)routerUrl
                                    eventStore:(EKEventStore *)eventStore
                               completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock {
    EKEventStore __block *blockEventStore = eventStore;
    if ([blockEventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        [blockEventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error) {
                    [OTSAlertView alertWithMessage:error.localizedDescription andCompleteBlock:nil];
                } else if (!granted) { //被⽤户拒绝,不允许访问日历
                    [OTSAlertView alertWithMessage:@"请设置允许访问日历~" andCompleteBlock:nil];
                } else {
                    if(startDate) {
                        if ([blockEventStore defaultCalendarForNewEvents] == nil) {
                            blockEventStore = [[EKEventStore alloc] init];
                        }
                        EKEvent *event = [EKEvent eventWithEventStore:blockEventStore];
                        event.title = remindContent;
                        event.startDate=startDate;
                        event.endDate=endDate;
                        if (routerUrl.length) {
                            event.URL = [NSURL URLWithString:routerUrl];
                        }
                        [event addAlarm:[EKAlarm alarmWithRelativeOffset:0]];
                        event.calendar = [blockEventStore defaultCalendarForNewEvents];
                        NSError *error;
                        [blockEventStore saveEvent:event span:EKSpanThisEvent error:&error];
                        if (aCompletionBlock) {
                            aCompletionBlock(error);
                        }
                    }
                }
            });
        }];
    }
}

+ (BOOL)isExistCalendarNotificationWithRouterUrl:(NSString *)routerUrl
                                       startTime:(NSDate *)startTime
                                      eventStore:(EKEventStore *)eventStore {
    NSArray *eventsArray = [self allCalendarEventsArrayWithEventStore:eventStore];
    if (eventsArray.count) {
        BOOL exist = NO;
        for (EKEvent *item in eventsArray) {
            if ([item.URL.absoluteString isEqualToString:routerUrl] && [item.startDate compare:startTime] == NSOrderedSame) {
                exist = YES;
                break;
            }
        }
        return exist;
    } else {
        return NO;
    }
}

+ (BOOL)isExistCalendarNotificationWithStartDate:(NSDate *)startDate
                                      eventStore:(EKEventStore *)eventStore
                                   remindContent:(NSString *)remindContent {
    NSArray *eventsArray = [self allCalendarEventsArrayWithEventStore:eventStore];
    if (eventsArray.count) {
        BOOL exist = NO;
        for (EKEvent *item in eventsArray) {
            if ([item.title isEqualToString:remindContent] && [item.startDate compare:startDate] == NSOrderedSame) {
                exist = YES;
                break;
            }
        }
        return exist;
    } else {
        return NO;
    }
}

+ (void)cancelCalendarNotificationWithRouterUrl:(NSString *)routerUrl
                                     eventStore:(EKEventStore *)eventStore
                                completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock {
    NSArray *eventsArray = [self allCalendarEventsArrayWithEventStore:eventStore];
    if (eventsArray.count) {
        for (EKEvent *item in eventsArray) {
            if ([item.URL.absoluteString isEqualToString:routerUrl]) {
                NSError *error;
                [eventStore removeEvent:item span:EKSpanThisEvent commit:YES error:&error];
                if (aCompletionBlock) {
                    aCompletionBlock(error);
                }
            }
        }
    }
}

+ (void)cancelCalendarNotificationWithStartDate:(NSDate *)startDate
                                     eventStore:(EKEventStore *)eventStore
                                  remindContent:(NSString *)remindContent
                                completionBlock:(OTSCalendarNotifCompletionBlock)aCompletionBlock {
    NSArray *eventsArray = [self allCalendarEventsArrayWithEventStore:eventStore];
    if (eventsArray.count) {
        for (EKEvent *item in eventsArray) {
            if ([item.title isEqualToString:remindContent] && [item.startDate compare:startDate] == NSOrderedSame) {
                NSError *error;
                [eventStore removeEvent:item span:EKSpanThisEvent commit:YES error:&error];
                if (aCompletionBlock) {
                    aCompletionBlock(error);
                }
            }
        }
    }
}

+ (NSArray *)allCalendarEventsArrayWithEventStore:(EKEventStore *)eventStore {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSDate *startDate = [formatter dateFromString:@"20160621000000"];
    NSDate *endDate = [NSDate dateWithTimeIntervalSinceNow:60*60*24*365*2];
    NSPredicate *predicate = [eventStore predicateForEventsWithStartDate:startDate endDate:endDate calendars:nil];
    return [eventStore eventsMatchingPredicate:predicate];
}

@end
