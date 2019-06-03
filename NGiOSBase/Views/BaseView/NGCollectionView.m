//
//  NGCollectionVIew.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGCollectionView.h"

#import "NGFuncDefine.h"

#import "NGCollectionViewCell.h"
#import "NGCollectionReusableView.h"
#import "NGWeakObjectDeathNotifier.h"

//category
#import "NSObject+BeeNotification.h"

@implementation NGCollectionView

- (id)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[NGCollectionViewCell class]]) {
        [(NGCollectionViewCell *)cell setIndexPath:indexPath];
    }
    
    return cell;
}

- (id)dequeueReusableSupplementaryViewOfKind:(NSString *)elementKind withReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [super dequeueReusableSupplementaryViewOfKind:elementKind withReuseIdentifier:identifier forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[NGCollectionReusableView class]]) {
        [(NGCollectionReusableView *)cell setIndexPath:indexPath];
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
    
    NGWeakObjectDeathNotifier *wo = [NGWeakObjectDeathNotifier new];
    [wo setOwner:delegate];
    WEAK_SELF;
    [wo setBlock:^(NGWeakObjectDeathNotifier *sender) {
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
