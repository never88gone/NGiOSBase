//
//  OTSBigImageBrowserPC.h
//  OneStore
//
//  Created by airspuer on 5/25/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import "OTSPresentController.h"

@class OTSBigImageBrowserPC;
@protocol BigImageBrowserPCDelegate <NSObject>

- (NSString *)bigImageBrowserPC:(OTSBigImageBrowserPC *)browser placeholderImageForIndex:(NSInteger)index;

@optional

- (NSInteger )numberOfItemInBigImageBrowser:(OTSBigImageBrowserPC *)browser;

- (NSString *)bigImageBrowserPC:(OTSBigImageBrowserPC *)browser highQualityImageURLForIndex:(NSInteger)index;

//记录当前页码
-(void)remenberChoosePageNum;

- (void)dismissBigImageBrowserPC:(OTSBigImageBrowserPC *)browser;
@end

@interface OTSBigImageBrowserPC : OTSPresentController

- (id)initWithSourceView:(UIView *)sourceView withSourceFrame:(CGRect)sourceRect;

@property(nonatomic, weak)id<BigImageBrowserPCDelegate>delegate;

@property(nonatomic, assign)NSInteger showIndex;

@property (nonatomic,strong)UILabel *molecularLabel;

@property (nonatomic,strong)UILabel *denominatorLabel;

@property(nonatomic, assign)NSInteger dataCount;

@property (nonatomic, assign)NSInteger pageCount;

@property(nonatomic, strong)UIImageView *currentImageView;

@property(nonatomic, strong)UICollectionView *pageImageView;


@end
