//
//  OTSCyclePageViewLayout.m
//  OneStorePublicFramework
//
//  Created by Aimy on 15/2/16.
//  Copyright (c) 2015年 yhd. All rights reserved.
//

#import "OTSCyclePageImageViewLayout.h"

@implementation OTSCyclePageImageViewLayout

- (instancetype)init
{
    if (self = [super init]) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
    }
    return self;
}

- (CGSize)itemSize
{
    return self.collectionView.bounds.size;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    [self invalidateLayout];
    return YES;
}

@end
