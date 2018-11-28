//
//  OTSImageFallingView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSView.h"

typedef NS_ENUM(NSInteger, ImageFallingType) {
    ImageFallingTypeRoll = 1, //1翻转下落
    ImageFallingTypeSimulate, //2模拟飘落
    ImageFallingTypeCommon, //3常规下落
    ImageFallingTypeWind, //4风吹效果（暂时不做，后台不会返回type==4）
    ImageFallingTypeDownToUp, //5从下而上
    ImageFallingTypeLeftToRight, //6从左到右
    ImageFallingTypeRightToLeft, //7从右到左
    ImageFallingTypeRandom = 99 //99随机
};

@interface OTSImageFallingElementView : UIImageView
@property (assign, nonatomic) CGFloat singleDuration; //单个落下时间
@property (assign, nonatomic) ImageFallingType fallingType; //飘落类型
@end

@interface OTSImageFallingView : OTSView
@property (assign, nonatomic) BOOL isFalling;
@property (assign, nonatomic) ImageFallingType fallingType; //飘落类型
@property (copy, nonatomic) NSString *imageName;
@property (copy, nonatomic) NSString *imageUrl;
@property (assign, nonatomic) NSInteger totalNumer; //整场飘落个数
@property (assign, nonatomic) CGFloat duration; //整场时间
@property (strong, nonatomic, readonly) NSMutableArray<OTSImageFallingElementView *> *reuseFallingImgViewArray;

- (void)startAnimation;
- (void)stopAnimation;

@end
