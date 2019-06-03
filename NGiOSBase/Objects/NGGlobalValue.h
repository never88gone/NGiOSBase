//
//  NGGlobalValue.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NGFuncDefine.h"


@interface NGGlobalValue : NSObject
AS_SINGLETON(NGGlobalValue)

@property (nonatomic, copy) NSDate         *serverTime;//根据差值算出的服务器时间

@end
