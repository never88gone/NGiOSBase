//
//  OTSGlobalValue.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
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
            serverTime = _serverTime,
userId = _userId;

DEF_SINGLETON(OTSGlobalValue)

- (instancetype)init
{
    if (self = [super init]) {

    }
    return self;
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





@end
