//
//  UINib+create.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UINib+create.h"

@implementation UINib (create)

+ (instancetype)createWithNibName:(NSString *)aNibName
{
    return [self createWithNibName:aNibName bundleName:nil];
}

+ (instancetype)createWithNibName:(NSString *)aNibName bundleName:(NSString *)aBundleName
{
    NSBundle *bundle = [NSBundle mainBundle];
    if (aBundleName.length) {
        bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:aBundleName withExtension:@"bundle"]];
    }
    
    return [UINib nibWithNibName:aNibName bundle:bundle];
}

@end
