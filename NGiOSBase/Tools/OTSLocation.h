//
//  OTSLocation.h
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.

#import <Foundation/Foundation.h>
@class CLPlacemark;
@class CLLocation;

//加个addressDictionary方便模拟数据
typedef void (^OTSCLManagerCompleteBlock)(CLPlacemark *mark, NSDictionary *addressDictionary, CLLocation *aLocation);

@interface OTSLocation : NSObject

- (void)start;
- (void)startWithCompleteBlock:(OTSCLManagerCompleteBlock)block;
- (void)stop;

@end
