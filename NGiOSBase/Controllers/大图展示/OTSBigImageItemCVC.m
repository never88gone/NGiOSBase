//
//  BigImageItemCVC.m
//  OneStore
//
//  Created by airspuer on 5/25/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import "OTSBigImageItemCVC.h"

#import "OTSPlaceholderImageView.h"

#import "OTSFuncDefine.h"

#import "UIView+loading.h"

#import "OTSSizeDefine.h"

@interface OTSBigImageItemCVC()<UIScrollViewDelegate>

@property(nonatomic, strong)OTSPlaceholderImageView *itemImageView;

@property (nonatomic,strong)UIScrollView *scrollview;
@end
@implementation OTSBigImageItemCVC 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.itemImageView = [[OTSPlaceholderImageView alloc]initWithFrame:CGRectMake(0, 0, UI_CURRENT_SCREEN_WIDTH, UI_CURRENT_SCREEN_WIDTH)];
        
        self.itemImageView.userInteractionEnabled = NO;
        self.itemImageView.contentMode = UIViewContentModeScaleAspectFit;
        self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, UI_CURRENT_SCREEN_WIDTH, UI_CURRENT_SCREEN_HEIGHT)];
        self.scrollview.maximumZoomScale = 2;
        self.scrollview.minimumZoomScale = 1;
        self.scrollview.showsVerticalScrollIndicator = NO;
        self.scrollview.showsHorizontalScrollIndicator = NO;
        self.scrollview.contentInset = UIEdgeInsetsMake((UI_CURRENT_SCREEN_HEIGHT - UI_CURRENT_SCREEN_WIDTH)/2, 0, 0, 0);

}
    return self;
}

- (void)updateWithDeafaultImageUrl:(NSString *)defaultUrl
               highQualityImageURL:(NSString *)highQualityImageURL
{
    
    WEAK_SELF;
    [[SDImageCache sharedImageCache] queryDiskCacheForKey:highQualityImageURL done:^(UIImage *image, SDImageCacheType cacheType) {
        STRONG_SELF;
        //如果高清图的缓存，就直接使用
        if (image) {
            self.itemImageView.image = image;
        }//没有就先显示模糊的图片，等待高清图片下载
        else{
            //让重复添加的loading视图消失
            [self hideLoading];
            [self showLoading];
            [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:defaultUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                STRONG_SELF;
                [self hideLoading];
                if (![defaultUrl isEqualToString:highQualityImageURL]) {
                    [self.itemImageView sd_setImageWithURL:[NSURL URLWithString:highQualityImageURL] placeholderImage:nil options:0 | SDWebImageDelayPlaceholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    }];
                }
                
            }];
        }
    }];
}

@end
