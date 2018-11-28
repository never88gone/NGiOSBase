//
//  OTSGlobalValue.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTSFuncDefine.h"

typedef NS_ENUM(NSInteger ,OTSRegionType)
{
    OTSRegionTypeNormal = 0,
    OTSRegionTypeApollo = 1,
    OTSRegionTypeWalmart = 2,
};

@interface OTSGlobalValue : NSObject

AS_SINGLETON(OTSGlobalValue)

@property (nonatomic, assign) NSTimeInterval dTime;//服务器时间-客户端时间
@property (nonatomic, copy) NSDate         *serverTime;//根据差值算出的服务器时间
@property (nonatomic, copy) NSString       *token;//token
@property (nonatomic, copy) NSNumber       *userId;//用户id
@property (nonatomic, copy) NSNumber       *locatedCityId;  //定位出的城市id
@property (nonatomic, copy) NSString       *sessionId;//sessionid，相当于cookie的id

@property (nonatomic, copy) NSString       *deviceToken;//推送的Devicetoken

@end
