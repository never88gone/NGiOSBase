//
//  BigImageCustomScrollview.m
//  OneStoreBase
//
//  Created by HU on 16/4/20.
//  Copyright © 2016年 OneStoreBase. All rights reserved.
//

#import "BigImageCustomScrollview.h"
#import "OTSFuncDefine.h"
#import "UIView+loading.h"

@interface BigImageCustomScrollview ()<UIScrollViewDelegate>

//@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation BigImageCustomScrollview


-(id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUpMainUI];
    }
    return self;
}

-(UIImageView*)imageView{

    if (!_imageView) {
        _imageView = [[UIImageView alloc]initForAutoLayout];
        _imageView.backgroundColor = [UIColor whiteColor];
    }
    return _imageView;
}

#pragma mark
-(void)setUpMainUI{
    
    self.delegate = self;
    self.maximumZoomScale = 2;
    self.minimumZoomScale = 1;
    [self addSubview:self.imageView];
    [self.imageView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self];
    [self.imageView autoAlignAxis:ALAxisVertical toSameAxisOfView:self];
    [self.imageView autoSetDimensionsToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleClick:)];
    [self addGestureRecognizer:singleTapGesture];
}
#pragma mark
-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView{

    return self.imageView;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self setNeedsLayout];
    [self layoutIfNeeded];
}
-(void)layoutSubviews{

    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.imageView.frame.size.width, self.imageView.frame.size.height);
    self.contentSize = CGSizeMake(self.imageView.frame.size.width, self.imageView.frame.size.height);
    CGFloat left = (self.imageView.frame.size.width)>[UIScreen mainScreen].bounds.size.width ? 0:([UIScreen mainScreen].bounds.size.width - self.imageView.frame.size.width )/2;
    CGFloat top = (self.imageView.frame.size.height)>[UIScreen mainScreen].bounds.size.height?0:([UIScreen mainScreen].bounds.size.height - self.imageView.frame.size.height)/2;
    self.contentInset = UIEdgeInsetsMake(top, left, 0, 0);
}
#pragma mark
-(void)singleClick:(id)sender{

    if ([self.bigImageDelegate respondsToSelector:@selector(sendBackDissVC)]) {
        
        [self.bigImageDelegate sendBackDissVC];
    }
}

#pragma mark
- (void)updateWithDeafaultImageUrl:(NSString *)defaultUrl
               highQualityImageURL:(NSString *)highQualityImageURL{

    WEAK_SELF;
    [[SDImageCache sharedImageCache] queryDiskCacheForKey:highQualityImageURL done:^(UIImage *image, SDImageCacheType cacheType) {
        STRONG_SELF;
        //如果高清图的缓存，就直接使用
        if (image) {
            self.imageView.image = image;
        }//没有就先显示模糊的图片，等待高清图片下载
        else{
            [self.superview showLoading];
            WEAK_SELF;
            [self.imageView sd_setImageWithURL:[NSURL URLWithString:defaultUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                STRONG_SELF;
//                [self hideLoading];
                [self.superview hideLoading];
                if (![defaultUrl isEqualToString:highQualityImageURL]) {
                    [self.imageView sd_setImageWithURL:[NSURL URLWithString:highQualityImageURL] placeholderImage:[UIImage imageNamed:@"默认图片750x750"] options:0 | SDWebImageDelayPlaceholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    }];
                }
                
            }];
        }
    }];
    
    
}


@end
