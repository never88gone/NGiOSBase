//
//  NGMD5Sha.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NGMD5Sha : NSObject
/**
 *  calculate file's MD5
 *
 *  @param path file path
 *
 *  @return file's MD5 value
 */
+(NSString*)getFileMD5WithPath:(NSString*)path;
@end
