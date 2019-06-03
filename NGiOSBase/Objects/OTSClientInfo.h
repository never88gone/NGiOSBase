//
//  OTSClientInfo.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTSFuncDefine.h"
#import "OTSValueObject.h"


@interface OTSClientInfo : OTSValueObject
AS_SINGLETON(OTSClientInfo)
@property (nonatomic, copy) NSString *clientAppVersion;// 客户端app版本号
@property (nonatomic, copy) NSString *clientSystem;// 客户端系统
@property (nonatomic, copy) NSString *clientVersion;// 客户端版本
@property (nonatomic, copy) NSString  *deviceToken;//推送的Devicetoken
@property (nonatomic, copy) NSString  *idfa;
@property (nonatomic, copy) NSString *deviceCode;// 设备号
@property (nonatomic, copy) NSString *phoneType;// 设备号  ----4.2.4新增
@property (nonatomic, copy) NSString *traderName;// 平台名称

@property (nonatomic, copy) NSNumber *latitude;// 纬度
@property (nonatomic, copy) NSNumber *longitude;// 经度


@end
