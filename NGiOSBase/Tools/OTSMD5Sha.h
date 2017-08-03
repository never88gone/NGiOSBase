//
//  OTSMD5Sha.h
//  OneStoreMain
//
//  Created by yuan jun on 15/1/29.
//  Copyright (c) 2015年 OneStore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OTSMD5Sha : NSObject
/**
 *  calculate file's MD5
 *
 *  @param path file path
 *
 *  @return file's MD5 value
 */
+(NSString*)getFileMD5WithPath:(NSString*)path;
@end
