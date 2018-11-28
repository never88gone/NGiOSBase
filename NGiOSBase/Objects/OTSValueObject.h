//
//  OTSValueObject.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "JSONModel.h"

@interface OTSValueObject : JSONModel
/**
 *  通过字典创建VO
 *
 *  @param aDict 字典
 *
 *  @return VO
 */
+ (instancetype)voWithDict:(NSDictionary *)aDict;

@end
