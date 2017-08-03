//
//  OTSGlobalValue.m
//  OneStoreFramework
//
//  Created by huang jiming on 14-7-31.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSGlobalValue.h"
//category
#import "NSObject+JsonToVO.h"
#import "NSNumber+safe.h"
//tool
#import "OTSJsonKit.h"
//cache
#import "OTSKeychain.h"
#import "OTSUserDefault.h"

NSString *const KeyChainSignatureKey = @"keychain.signatureKey";

@interface OTSGlobalValue()

@property (nonatomic, copy) NSString *signatureKey;                  //解密后的签名密钥
@end

@implementation OTSGlobalValue
@synthesize signatureKey = _signatureKey,
            locatedCityId = _locatedCityId,
            serverTime = _serverTime,
            userId = _userId,
            sessionId = _sessionId;

DEF_SINGLETON(OTSGlobalValue)

- (instancetype)init
{
    if (self = [super init]) {
        
        NSNumber *isActive = [OTSKeychain getKeychainValueForType:OTS_KEYCHAIN_ISACTIVE];
        if (!isActive.boolValue) {
            [OTSKeychain setKeychainValue:@(YES) forType:OTS_KEYCHAIN_ISACTIVE];
        }
        
        //是否新版本第一次启动
        NSString *lastRunVersion = [OTSUserDefault getValueForKey:OTS_DEF_KEY_LAST_RUN_VERSION];
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
        if (!lastRunVersion || ![lastRunVersion isEqualToString:currentVersion]) {
            [OTSUserDefault setValue:currentVersion forKey:OTS_DEF_KEY_LAST_RUN_VERSION];
        } else {
         
        }
        
        //获取session id，用于购物车接口端本地缓存
        _sessionId = [OTSUserDefault getValueForKey:OTS_DEF_KEY_SESSION_ID];
        
    }
    return self;
}


- (void)setLocatedCityId:(NSNumber *)locatedCityId
{
    if ([locatedCityId safeIsEqualToNumber:_locatedCityId]) {
            return;
        }
    _locatedCityId = @(locatedCityId.integerValue);
    [OTSUserDefault setValue:locatedCityId forKey:@"OTS_DEF_KEY_LOCATED_CITYID"];
    
}
- (NSDate *)serverTime{
    //根据本地时间与服务器时间的差异 算出的当前服务器的时间  **不要乱改，其他地方有用到
    _serverTime = [NSDate dateWithTimeIntervalSinceNow:self.dTime];
    return _serverTime;
}
- (NSString*)deviceToken
{
    if (_deviceToken==nil) {
        _deviceToken=[OTSKeychain getKeychainValueForType:OTS_KEYCHAIN_DEVICETOKEN];
    }
    return _deviceToken;
}
/**
 *  功能:方法重写，保证返回不为nil
 */
- (NSString *)sessionId
{
    if (_sessionId == nil) {
        return @"";
    } else {
        return _sessionId;
    }
}



- (NSNumber *)userId
{
    _userId = [OTSUserDefault getValueForKey:@"userid"];
    return _userId;
}


- (void)setUserId:(NSNumber *)userId
{
    if (userId == nil) {
        _userId = nil;
        [OTSUserDefault setValue:_userId forKey:@"userid"];
    } else if (![_userId isKindOfClass:[NSNumber class]] || ![_userId isEqualToNumber:userId]) {
        _userId = userId;
        [OTSUserDefault setValue:_userId forKey:@"userid"];
    }
}
-(void)setSessionId:(NSString *)sessionId
{
    if (![_sessionId isEqualToString:sessionId]) {
        _sessionId = sessionId;
       [OTSUserDefault setValue:_sessionId forKey:OTS_DEF_KEY_SESSION_ID];
    }
}




@end
