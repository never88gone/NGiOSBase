//
//  OTSActivityTracing.m
//  OneStoreFramework
//
//  Created by Aimy on 3/24/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import "OTSActivityTracing.h"

//#import <Crashlytics/Crashlytics.h>

#define TRACING_THREAD_COUNT 3

@interface OTSActivityTracing ()

@property (nonatomic, strong) NSMutableArray *tracingThreads;

@end

@implementation OTSActivityTracing

DEF_SINGLETON(OTSActivityTracing)

- (instancetype)init
{
    self = [super init];
    _tracingThreads = @[].mutableCopy;
    return self;
}

- (void)setCurrentRunningIdentifier:(NSString *)name
{
    [_tracingThreads insertObject:name atIndex:0];

    if (_tracingThreads.count > TRACING_THREAD_COUNT) {
        [_tracingThreads removeLastObject];
    }

//    NSString *tracingString = [_tracingThreads componentsJoinedByString:@"\n"];
//    if (tracingString) {
//        [[Crashlytics sharedInstance] setObjectValue:tracingString forKey:@"extraData"];
//    }
}

+ (void)crash
{
    //[[Crashlytics sharedInstance] crash];
}

@end
