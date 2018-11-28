//
//  OTSCollectionReusableView.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSCollectionReusableView.h"
//category
#import "NSObject+BeeNotification.h"

@implementation OTSCollectionReusableView

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (UINib *)nib{
    NSString *className = NSStringFromClass([self class]);
    return [UINib nibWithNibName:className bundle:nil];
}

- (void)updateWithCellData:(id)aData
{
    
}

+ (CGSize)sizeForCellData:(id)aData
{
    return CGSizeZero;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}


@end
