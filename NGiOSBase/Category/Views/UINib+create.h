//
//  UINib+create.h
//  OneStoreFramework
//
//  Created by Aimy on 8/26/14.
//  Copyright (c) 2014 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (create)

+ (instancetype)createWithNibName:(NSString *)aNibName;

+ (instancetype)createWithNibName:(NSString *)aNibName bundleName:(NSString *)aBundleName NS_DEPRECATED_IOS(6_0,7_0,"Pad的资源已经合并到Application Target中，不需要从bundle中取出来，请使用不带bundle的方法");

@end
