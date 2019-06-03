//
//  NGLocation.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.

#import <Foundation/Foundation.h>
@class CLPlacemark;
@class CLLocation;

//加个addressDictionary方便模拟数据
typedef void (^NGCLManagerCompleteBlock)(CLPlacemark *mark, NSDictionary *addressDictionary, CLLocation *aLocation);

@interface NGLocation : NSObject

- (void)start;
- (void)startWithCompleteBlock:(NGCLManagerCompleteBlock)block;
- (void)stop;

@end
