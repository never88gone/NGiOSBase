//
//  NGMask.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NGMaskDelegate <NSObject>

/**
 *  是否相应mask手势
 *
 *  @return BOOL
 */
- (BOOL)shouldShowMask;
/**
 *  显示了Mask
 */
- (void)didShowMask;
/**
 *  隐藏mask
 */
- (void)didHideMask;

@end

@interface NGMask : NSObject

/**
 *  代理
 */
@property (nonatomic, weak) id<NGMaskDelegate> delegate;

@property (nonatomic, strong) UIView *doGesView;

// 创建阴影背景
-(void)createDoGesViewWithViewWidth:(NSInteger)width;

/**
 *  创建基于手势的Mask
 *
 *  @param aForegroundView 用来遮罩的View
 *  @param aBackgroundView 需要被遮罩的View
 *  @param aEdge           拉动到左边剩下的边距
 *  @param aGesEdge        可以响应手势的右边距
 *
 *  @return NGMask
 */
+ (instancetype)maskWithForegroundView:(UIView *)aForegroundView backgroundView:(UIView *)aBackgroundView edge:(CGFloat)aEdge gesEdge:(CGFloat)aGesEdge;
/**
 *  拉动mask到屏幕坐标
 */
- (void)beginMask;
/**
 *  恢复mask
 */
- (void)endMask;
/**
 *  取消mask，释放手势，以及保存的backgroundView
 */
- (void)cancelMask;


@end
