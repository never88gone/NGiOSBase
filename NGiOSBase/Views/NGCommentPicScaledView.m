//
//  NGCommentPicScaledView.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGCommentPicScaledView.h"
#import "NGScrollView.h"
#import <SDWebImage/SDWebImageManager.h>
#import <SDWebImage/UIImageView+WebCache.h>
@interface NGCommentPicScaledView()<UIGestureRecognizerDelegate>

@property(nonatomic, strong) UIImageView *picImageView;
@property(nonatomic) CGFloat currentScale;
@property(nonatomic) CGRect orginRec;
@property(nonatomic, strong) NGScrollView *mScrollView;

@end

@implementation NGCommentPicScaledView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.currentScale = 1.0;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor clearColor];
        UIPinchGestureRecognizer *ges = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinches:)];
        [self addGestureRecognizer:ges];
        
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        tapGes.numberOfTapsRequired = 2;
        self.doubleTapOfView = tapGes;
        [self addGestureRecognizer:tapGes];
        
        self.mScrollView = [[NGScrollView alloc]initWithFrame:self.bounds];
        self.mScrollView.bounces = NO;
        self.mScrollView.showsHorizontalScrollIndicator = NO;
        self.mScrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.mScrollView];
    }
    return self;
}
- (void)setPicURLStr:(NSString *)picURLStr {
    if (self.picImageView) {
        [self.picImageView removeFromSuperview];
        self.picImageView = nil;
    }
    
    self.picImageView = [[UIImageView alloc]initWithFrame:self.mScrollView.bounds];
    [self.picImageView sd_setImageWithURL:[NSURL URLWithString:picURLStr] placeholderImage:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (error==nil && image!=nil) {
            CGRect rec = _picImageView.frame;
            CGSize imageSize = CGSizeMake(CGImageGetWidth(image.CGImage), CGImageGetHeight(image.CGImage));
            double imageCom = imageSize.width/imageSize.height;
            double oldCom = _picImageView.bounds.size.width/_picImageView.bounds.size.height;
            // 等比列缩放图片
            if (imageCom > oldCom) {
                rec.size.height = imageSize.height*_picImageView.bounds.size.width/imageSize.width;
                rec.size.width = _picImageView.bounds.size.width;
            }else{
                rec.size.width = imageSize.width*_picImageView.bounds.size.height/imageSize.height;
                rec.size.height = _picImageView.bounds.size.height;
            }
            rec.origin.x = _picImageView.frame.size.width-rec.size.width > 0 ? (_picImageView.frame.size.width-rec.size.width)/2+rec.origin.x : rec.origin.x;
            rec.origin.y = _picImageView.frame.size.height-rec.size.height > 0 ? (_picImageView.frame.size.height-rec.size.height)/2+rec.origin.y : rec.origin.y;
            
            _picImageView.frame = rec;
            self.orginRec = rec;
            _picImageView.image = image;
        }
    }];
    [self.mScrollView setContentSize:self.mScrollView.bounds.size];
    [self.mScrollView addSubview:_picImageView];
}


- (void)handleTap:(UITapGestureRecognizer*)tapSender {
    if (tapSender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.2 animations:^{
            if (self.currentScale > 1.0 || self.currentScale <1.0) {
                _picImageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                self.currentScale = 1.0;
            }else{
                _picImageView.transform = CGAffineTransformMakeScale(2.0, 2.0);
                self.currentScale = 2.0;
            }
            float x = -_picImageView.frame.origin.x+_orginRec.origin.x;
            float y = -_picImageView.frame.origin.y+_orginRec.origin.y;
            CGRect rec = self.picImageView.frame;
            rec.origin = self.orginRec.origin;
            
            self.mScrollView.contentInset = UIEdgeInsetsMake(y, x, y, x);
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void) handlePinches:(UIPinchGestureRecognizer*)paramSender{
    //UIPinchGestureRecognizer其中有两个比较重要的变量 scale 和 velocity,前者是一个比例范围,后者是一个变化速率的,也就是说每次变化的一个像素点。
    if (paramSender.state == UIGestureRecognizerStateEnded){
        self.currentScale = paramSender.scale;
        
        float x = -_picImageView.frame.origin.x+_orginRec.origin.x;
        float y = -_picImageView.frame.origin.y+_orginRec.origin.y;
        if (x > 0 || y > 0) {
            self.mScrollView.contentInset = UIEdgeInsetsMake(y, x, y, x);
        }else{
            self.mScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }
    } else if (paramSender.state == UIGestureRecognizerStateBegan && self.currentScale != 0.0f){
        paramSender.scale = self.currentScale;
    }
    if (paramSender.scale != NAN && paramSender.scale != 0.0){
        _picImageView.transform = CGAffineTransformMakeScale(paramSender.scale, paramSender.scale);
    }
}

@end
