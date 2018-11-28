//
//  OTSImageFallingView.m
//  OneStoreBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSImageFallingView.h"
#import "OTSSizeDefine.h"
#import "OTSSize.h"

#define OTSImageFallingElementViewWidth [OTSSize getLengthWithSizeType:OTSSizeType3_5 andLength:30]
#define OTSImageFallingBigViewWidth [OTSSize getLengthWithSizeType:OTSSizeType4_7 andLength:320]
#define OTSImageFallingBigViewHeight [OTSSize getLengthWithSizeType:OTSSizeType4_7 andLength:480]

@implementation OTSImageFallingElementView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

- (void)prepareForReuse {
    self.alpha = 1.0f;
    self.singleDuration = 0.f;
}

- (void)configForRandom {
    if (!self.singleDuration) {
        self.singleDuration = 3.f;
    }
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (self.fallingType <= ImageFallingTypeDownToUp) {
        if (newSuperview) {
            CGFloat scale = [self p_getRandomNumber:8 to:12] / 10.0f;
            self.transform = CGAffineTransformMakeScale(scale, scale);
            CAKeyframeAnimation *animation = [self p_keyframeAniamtion];
            animation.delegate = self;
            [self.layer addAnimation:animation forKey:@"key"];
        } else {
            UIView *superView = self.superview;
            if ([superView isKindOfClass:[OTSImageFallingView class]]) {
                OTSImageFallingView *rainView = (id)superView;
                [rainView.reuseFallingImgViewArray addObject:self];
            }
        }
    } else {
        CGPoint startCenter = CGPointMake(0, 0);
        switch (self.fallingType) {
            case ImageFallingTypeLeftToRight:
                startCenter = CGPointMake(-OTSImageFallingBigViewWidth/2, UI_CURRENT_SCREEN_HEIGHT/2);
                break;
            case ImageFallingTypeRightToLeft:
                startCenter = CGPointMake(UI_CURRENT_SCREEN_WIDTH+OTSImageFallingBigViewWidth/2, UI_CURRENT_SCREEN_HEIGHT/2);
                break;
            default:
                break;
        }
        self.center = startCenter;
        
        [self performSelector:@selector(animationMove) withObject:nil afterDelay:0.5];
    }
}

-(void) animationMove
{
    CGPoint startCenter = CGPointMake(0, 0);
    CGPoint endCenter = CGPointMake(0, 0);
    switch (self.fallingType) {
        case ImageFallingTypeLeftToRight:
            startCenter = CGPointMake(-OTSImageFallingBigViewWidth/2, UI_CURRENT_SCREEN_HEIGHT/2);
            endCenter = CGPointMake(UI_CURRENT_SCREEN_WIDTH+OTSImageFallingBigViewWidth/2, UI_CURRENT_SCREEN_HEIGHT/2);
            break;
        case ImageFallingTypeRightToLeft:
            startCenter = CGPointMake(UI_CURRENT_SCREEN_WIDTH+OTSImageFallingBigViewWidth/2, UI_CURRENT_SCREEN_HEIGHT/2);
            endCenter = CGPointMake(-OTSImageFallingBigViewWidth/2, UI_CURRENT_SCREEN_HEIGHT/2);
            break;
        default:
            break;
    }
    self.center = startCenter;
    [UIView animateWithDuration:self.singleDuration animations:^{
        self.center = endCenter;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        [self removeFromSuperview];
    }
}

#pragma mark - Private
-(NSInteger)p_getRandomNumber:(NSInteger)from to:(NSInteger)to {
    return from + (arc4random() % (to - from + 1));
}

- (CAKeyframeAnimation *)p_keyframeAniamtion {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = [self p_randomBezierPath];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fillMode = kCAFillModeBoth;
    animation.duration = self.singleDuration;
    return animation;
    
}

- (CGPathRef)p_randomBezierPath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat randomWdith = [self p_randomWidth];
    if (self.fallingType == ImageFallingTypeDownToUp) {
        [path moveToPoint:CGPointMake(randomWdith, UI_CURRENT_SCREEN_HEIGHT+OTSImageFallingElementViewWidth*2)];
        [path addLineToPoint:CGPointMake(randomWdith, -OTSImageFallingElementViewWidth*2)];
    } else {
        [path moveToPoint:CGPointMake(randomWdith, -OTSImageFallingElementViewWidth*2)];
        [path addLineToPoint:CGPointMake(randomWdith, UI_CURRENT_SCREEN_HEIGHT+OTSImageFallingElementViewWidth*2)];
    }
    return path.CGPath; //设置路径
}

- (CGPoint)p_CGPointMake:(CGFloat)xPs yPs:(CGFloat)yPs {
    return CGPointMake([OTSSize getLengthWithSizeType:OTSSizeType3_5 andLength:xPs], [OTSSize getLengthWithSizeType:OTSSizeType3_5 andLength:yPs]);
}

- (CGFloat)p_randomWidth {
    return (arc4random()%100) / 100.f * UI_CURRENT_SCREEN_WIDTH;
}

@end

@interface OTSImageFallingView ()
@property (nonatomic, strong) CAEmitterLayer *emitterLayer;
@end

@implementation OTSImageFallingView
{
    NSTimer *_fallingTimer;
    NSTimer *_durationTimer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        for (UIView *view in newSuperview.subviews) {
            if ([view isKindOfClass:[self class]]) {
                [view removeFromSuperview];
            }
        }
    }
}

- (void)startAnimation {
    if (self.isFalling) return;
    self.isFalling = YES;
    
    if (_durationTimer) {
        [_durationTimer invalidate];
    }
    _durationTimer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(p_durationTimerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_durationTimer forMode:NSRunLoopCommonModes];
    if (!self.fallingType || self.fallingType == ImageFallingTypeRandom) {
        self.fallingType = arc4random()%7 + 1;
    }
    if (self.fallingType <= ImageFallingTypeDownToUp) {
        if (self.fallingType >= ImageFallingTypeCommon) {
            [self p_startFalling];
        } else {
            if (self.imageUrl.length) {
                UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:self.imageUrl];
                if (image) {
                    if (self.fallingType == ImageFallingTypeRoll) {
                        self.emitterLayer = [self p_fallingEmitterLayerWithRotate:YES image:image];
                    } else {
                        self.emitterLayer = [self p_fallingEmitterLayerWithRotate:NO image:image];
                    }
                    [self.layer addSublayer:self.emitterLayer];
                } else {
                    WEAK_SELF;
                    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:self.imageUrl] options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                        STRONG_SELF;
                        if (!error && finished) {
                            if (self.fallingType == ImageFallingTypeRoll) {
                                self.emitterLayer = [self p_fallingEmitterLayerWithRotate:YES image:image];
                            } else {
                                self.emitterLayer = [self p_fallingEmitterLayerWithRotate:NO image:image];
                            }
                            [self.layer addSublayer:self.emitterLayer];
                        }
                    }];
                }
            } else if (self.imageName.length) {
                if (self.fallingType == ImageFallingTypeRoll) {
                    self.emitterLayer = [self p_fallingEmitterLayerWithRotate:YES image:[UIImage imageNamed:self.imageName]];
                } else {
                    self.emitterLayer = [self p_fallingEmitterLayerWithRotate:NO image:[UIImage imageNamed:self.imageName]];
                }
                [self.layer addSublayer:self.emitterLayer];
            }
        }
    } else {
        OTSImageFallingElementView *elementView = [[OTSImageFallingElementView alloc] initWithFrame:CGRectMake(0, 0, OTSImageFallingBigViewWidth, OTSImageFallingBigViewHeight)];
        elementView.fallingType = self.fallingType;
        elementView.singleDuration = self.duration;
        if (self.imageUrl.length) {
            [elementView sd_setImageWithURL:[NSURL URLWithString:self.imageUrl]];
        } else if (self.imageName.length) {
            elementView.image = [UIImage imageNamed:self.imageName];
        }
        [self addSubview:elementView];
    }
}

- (void)stopAnimation {
    self.isFalling = NO;
    [_durationTimer invalidate];
    _durationTimer = nil;
    if (self.fallingType <= ImageFallingTypeDownToUp) {
        if (self.fallingType >= ImageFallingTypeCommon) {
            [_fallingTimer invalidate];
            _fallingTimer = nil;
        } else {
            self.emitterLayer.birthRate = 0;
        }
    }
    
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:10];
}

- (void)p_startFalling {
    if (_fallingTimer) {
        [_fallingTimer invalidate];
    }
    _fallingTimer = [NSTimer timerWithTimeInterval:self.duration/self.totalNumer target:self selector:@selector(p_popImageFallingImgView) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_fallingTimer forMode:NSRunLoopCommonModes];
}

- (OTSImageFallingElementView *)p_dequeueImageFallingImgView {
    OTSImageFallingElementView *aImageFallingImgView;
    if (_reuseFallingImgViewArray.count > 0) {
        aImageFallingImgView = [_reuseFallingImgViewArray lastObject];
        [_reuseFallingImgViewArray removeLastObject];
    } else {
        aImageFallingImgView = [[OTSImageFallingElementView alloc] initWithFrame:CGRectMake(-OTSImageFallingElementViewWidth*2, -OTSImageFallingElementViewWidth*2, OTSImageFallingElementViewWidth, OTSImageFallingElementViewWidth)];
        aImageFallingImgView.fallingType = self.fallingType;
        if (self.imageUrl.length) {
            [aImageFallingImgView sd_setImageWithURL:[NSURL URLWithString:self.imageUrl]];
        } else if (self.imageName.length) {
            aImageFallingImgView.image = [UIImage imageNamed:self.imageName];
        }
    }
    [aImageFallingImgView prepareForReuse];
    return aImageFallingImgView;
}

- (void)p_popImageFallingImgView {
    OTSImageFallingElementView *sprite = [self p_dequeueImageFallingImgView];
    [sprite configForRandom];
    [self addSubview:sprite];
}

- (void)p_durationTimerAction {
    self.duration --;
    if (self.duration <= 0.f) {
        [self stopAnimation];
    }
}

- (CAEmitterLayer *)p_fallingEmitterLayerWithRotate:(BOOL)isRotate image:(UIImage *)image {
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.frame = self.bounds;
    snowEmitter.emitterPosition = CGPointMake(UI_CURRENT_SCREEN_WIDTH / 2.0, -OTSImageFallingElementViewWidth);
    snowEmitter.emitterSize  = CGSizeMake(UI_CURRENT_SCREEN_WIDTH, 0.0);
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    snowEmitter.emitterMode  = kCAEmitterLayerOutline;
    
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.birthRate = self.totalNumer / self.duration / 2;
    snowflake.lifetime = UI_CURRENT_SCREEN_HEIGHT / self.totalNumer;
    snowflake.velocity = self.totalNumer * 2;
    snowflake.velocityRange = 5;
    snowflake.yAcceleration = self.totalNumer;
    snowflake.emissionRange = 5;
    snowflake.spin = isRotate ? M_PI : 0;
    CGFloat scaleRange = 0.2;
    CGFloat width = image.size.width;
    snowflake.scale = OTSImageFallingElementViewWidth / width / [[UIScreen mainScreen] scale];
    snowflake.scaleRange = snowflake.scale * scaleRange;
    snowflake.contents  = (id)[image CGImage];
    snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
    return snowEmitter;
}

- (void)dealloc {
    [_fallingTimer invalidate];
    _fallingTimer = nil;
    [_durationTimer invalidate];
    _durationTimer = nil;
}

@end
