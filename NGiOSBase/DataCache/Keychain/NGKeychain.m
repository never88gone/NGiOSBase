//
//  NGKeychain.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGKeychain.h"

#import "KeychainItemWrapper.h"

#import "NGFuncDefine.h"

#import "NGLog.h"

#define NG_KEYCHAIN_IDENTITY @"NGiOSBase"

#define NG_KEYCHAIN_DICT_ENCODE_KEY_VALUE @"NG_KEYCHAIN_DICT_ENCODE_KEY_VALUE"

@interface NGKeychain ()

@property (nonatomic, strong) KeychainItemWrapper *NGItem;

@property (nonatomic, strong) NSArray *commonClasses;

@end

@implementation NGKeychain

DEF_SINGLETON(NGKeychain);

- (id)init
{
    if (self = [super init]) {
        self.commonClasses = @[[NSNumber class],
                               [NSString class],
                               [NSMutableString class],
                               [NSData class],
                               [NSMutableData class],
                               [NSDate class],
                               [NSValue class]];
        
        [self setup];
    }
    return self;
}

- (void)setup
{
    KeychainItemWrapper *wrapper = [[KeychainItemWrapper alloc] initWithIdentifier:NG_KEYCHAIN_IDENTITY accessGroup:nil];
	self.NGItem = wrapper;
}

+ (void)setKeychainValue:(id<NSCopying, NSObject>)value forType:(NSString *)type
{
    NGKeychain *keychain = [NGKeychain sharedInstance];
    
    __block BOOL find = NO;
    [keychain.commonClasses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Class class = obj;
        if ([value isKindOfClass:class]) {
            find = YES;
            *stop = YES;
        }
        
    }];
    
    if (!find && value) {
        NGLogE(@"error set keychain type [%@], value [%@]",type ,value);
        return ;
    }
    
    if (!type || !keychain.NGItem) {
        return ;
    }
    
    id data = [keychain.NGItem objectForKey:(__bridge id)kSecValueData];
    NSMutableDictionary *dict = nil;
    if (data && [data isKindOfClass:[NSMutableData class]]) {
        dict = [keychain decodeDictWithData:data];
    }
    
    if (!dict) {
        dict = [NSMutableDictionary dictionary];
    }
    
    dict[type] = value;
    data = [keychain encodeDict:dict];
    
    if (data && [data isKindOfClass:[NSMutableData class]]) {
        [keychain.NGItem setObject:NG_KEYCHAIN_IDENTITY forKey:(__bridge id)(kSecAttrAccount)];
        [keychain.NGItem setObject:data forKey:(__bridge id)kSecValueData];
    }
}

+ (id)getKeychainValueForType:(NSString *)type
{
    NGKeychain *keychain = [NGKeychain sharedInstance];
    if (!type || !keychain.NGItem) {
        return nil;
    }
    
    id data = [keychain.NGItem objectForKey:(__bridge id)kSecValueData];
    NSMutableDictionary *dict = nil;
    if (data && [data isKindOfClass:[NSMutableData class]]) {
        dict = [keychain decodeDictWithData:data];
    }
    
    return dict[type];
}

+ (void)reset
{
    NGKeychain *keychain = [NGKeychain sharedInstance];
    if (!keychain.NGItem) {
        return ;
    }
    
    id data = [keychain encodeDict:[NSMutableDictionary dictionary]];
    
    if (data && [data isKindOfClass:[NSMutableData class]]) {
        [keychain.NGItem setObject:NG_KEYCHAIN_IDENTITY forKey:(__bridge id)(kSecAttrAccount)];
        [keychain.NGItem setObject:data forKey:(__bridge id)kSecValueData];
    }
}

- (NSMutableData *)encodeDict:(NSMutableDictionary *)dict
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:dict forKey:NG_KEYCHAIN_DICT_ENCODE_KEY_VALUE];
    [archiver finishEncoding];
    return data;
}

- (NSMutableDictionary *)decodeDictWithData:(NSMutableData *)data
{
    NSMutableDictionary *dict = nil;
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    if ([unarchiver containsValueForKey:NG_KEYCHAIN_DICT_ENCODE_KEY_VALUE]) {
        @try {
            dict = [unarchiver decodeObjectForKey:NG_KEYCHAIN_DICT_ENCODE_KEY_VALUE];
        }
        @catch (NSException *exception) {
            NGLogE(@"keychain 解析错误");
            [NGKeychain reset];
        }
    }
    [unarchiver finishDecoding];
    
    return dict;
}

@end
