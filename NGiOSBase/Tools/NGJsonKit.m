//
//  NGJsonKit.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGJsonKit.h"
#import "NSObject+JsonToVO.h"
#import "NGLog.h"

@implementation NGJsonKit

+ (NSString *)stringFromDict:(NSDictionary *)aDict
{
    return [self stringFromDict:aDict options:0];
}

+ (NSString *)prettyStringFromDict:(NSDictionary *)aDict
{
    return [self stringFromDict:aDict options:NSJSONWritingPrettyPrinted];
}

+ (NSString *)stringFromDict:(NSDictionary *)aDict options:(NSJSONWritingOptions)option
{
    return [self stringFromJSONObject:aDict options:option];
}

+ (NSString *)stringFromJSONObject:(id)aObj options:(NSJSONWritingOptions)option
{
    NSString *json = nil;
    if ([NSJSONSerialization isValidJSONObject:aObj]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:aObj options:option error:&error];
        if (!error) {
            json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        else {
            NGLogE(@"error convert to json,%@,%@",error,aObj);
        }
    }
    
    return json;
}

+ (NSDictionary *)dictFromString:(NSString *)aString
{
    if (aString == nil) {
        return nil;
    }
    
    NSData *theData = [aString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSError *error = nil;
    
    NSDictionary *resultDict = [NSJSONSerialization JSONObjectWithData:theData options:kNilOptions error:&error];
    
    if (error) {
        NGLogE(@"error convert json string to dict,%@,%@", aString, error);
        return nil;
    }
    else {
        return resultDict;
    }
}

+ (NSArray *)arrayFromString:(NSString *)aString
{
    if (aString == nil) {
        return nil;
    }
    
    NSData *theData = [aString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSError *error = nil;
    
    NSArray *resultArray = [NSJSONSerialization JSONObjectWithData:theData options:kNilOptions error:&error];
    
    if (error) {
        NGLogE(@"error convert json string to array,%@,%@", aString, error);
        return nil;
    } else {
        return resultArray;
    }
}

+ (id)voFromString:(NSString *)aString
{
    NSDictionary *theDict = [self dictFromString:aString];
    
    id dataDic = [theDict objectForKey:@"data"];
    if ([dataDic isKindOfClass:[NSDictionary class]]) {
        NSString *voName = [NSObject classNameWithDictionary:dataDic];
        if (voName.length > 0) {
            id theVO = [[NSClassFromString(voName) alloc] initWithMyDictionary:dataDic];
            return theVO;
        } else {
            return dataDic;
        }
    } else if([dataDic isKindOfClass:[NSArray class]]) {
        return [NSObject setListWithArray:dataDic];
    } else {
        return dataDic;
    }
}

@end
