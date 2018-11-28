//
//  UICollectionView+safe.m
//  OneStoreBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UICollectionView+safe.h"
#import "NSObject+swizzle.h"

@implementation UICollectionView (safe)

+ (void)load
{
    [self exchangeMethod:@selector(selectItemAtIndexPath:animated:scrollPosition:) withMethod:@selector(safeSelectItemAtIndexPath:animated:scrollPosition:)];
    [self exchangeMethod:@selector(scrollToItemAtIndexPath:atScrollPosition:animated:) withMethod:@selector(safeScrollToItemAtIndexPath:atScrollPosition:animated:)];
    [self exchangeMethod:@selector(reloadSections:) withMethod:@selector(safeReloadSections:)];
}

- (void)safeSelectItemAtIndexPath:(NSIndexPath *)indexPath
                         animated:(BOOL)animated
                   scrollPosition:(UICollectionViewScrollPosition)scrollPosition
{
    if (indexPath.section>=[self numberOfSections] || indexPath.item>=[self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [self safeSelectItemAtIndexPath:indexPath animated:animated scrollPosition:scrollPosition];
}


- (void)safeScrollToItemAtIndexPath:(NSIndexPath *)indexPath
                   atScrollPosition:(UICollectionViewScrollPosition)scrollPosition
                           animated:(BOOL)animated
{
    if (indexPath.section>=[self numberOfSections] || indexPath.item>=[self numberOfItemsInSection:indexPath.section]) {
        return ;
    }
    
    [self safeScrollToItemAtIndexPath:indexPath atScrollPosition:scrollPosition animated:animated];
}

- (void)safeReloadSections:(NSIndexSet *)sections
{
    if ([sections indexGreaterThanOrEqualToIndex:[self numberOfSections]] != NSNotFound) {
        return;
    }
    
    [self safeReloadSections:sections];
}

@end
