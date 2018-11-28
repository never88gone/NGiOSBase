//
//  OTSCollectionVIew.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSCollectionView.h"

#import "OTSFuncDefine.h"

#import "OTSCollectionViewCell.h"
#import "OTSCollectionReusableView.h"
#import "OTSWeakObjectDeathNotifier.h"

//category
#import "NSObject+BeeNotification.h"

@implementation OTSCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[OTSCollectionViewCell class]]) {
        [(OTSCollectionViewCell *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[OTSCollectionReusableView class]]) {
        [(OTSCollectionReusableView *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

- (void)setDelegate:(id<UICollectionViewDelegate>)delegate
{
    [super setDelegate:delegate];
    
    if (delegate == nil) {
        return;
    }
    
    OTSWeakObjectDeathNotifier *wo = [OTSWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(OTSWeakObjectDeathNotifier *sender) {
        STRONG_SELF;
        self.delegate = nil;
        self.dataSource = nil;
    }];
}

- (void)reloadData
{
    [self.collectionViewLayout invalidateLayout];
    [super reloadData];
}

@end
