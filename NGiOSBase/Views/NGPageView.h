//
//  NGPageView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>
//view
#import "NGScrollView.h"
#import "NGPageControl.h"

typedef enum _NGPageViewModeType
{
    KNGPageViewLandscape = 0      // Portrait
    , KNGPageViewPortrait        // Landscape
}
NGPageViewModeType;

@protocol NGPageViewDelegate;

@interface NGPageView : UIView<UIScrollViewDelegate>

@property(nonatomic, weak) id<NGPageViewDelegate> delegate;

@property(nonatomic, assign) NSInteger currentScrollPage;

@property(nonatomic, assign) NGPageViewModeType mode;

@property(nonatomic, assign)BOOL  continuous; //是否连续滚动,首尾想接

@property(nonatomic, strong, readonly) NSMutableArray *contentViewArray;

/**
 *  获取PageControl
 */
- (NGPageControl *)getPageControl;

/**
 *	功能:初始化
 *
 *	@param frame 布局
 *	@param aDelegate 代理
 *
 *	@return  对象
 */
- (id)initWithFrame:(CGRect)frame
           delegate:(id<NGPageViewDelegate>)aDelegate;

/**
 *  功能:初始化方法
 *  返回值:当前对象
 */
- (id)initWithFrame:(CGRect)frame
           delegate:(id<NGPageViewDelegate>)aDelegate
          sleepTime:(NSInteger)aSleepTime;
/**
 *	功能:设置滑动的PageControl
 */
- (void)setPageControlWithActiveColor:(UIColor *)activeColor
                    withInactiveColor:(UIColor *)inactiveColor;

/**
 *  使用图片,设置滑块
 *
 *  @param activeImage 活动的image
 *  @param inactiveImage 不活动的image
 */
- (void)setPageControlWithActiveImage:(UIImage *)activeImage
                    withInactiveImage:(UIImage *)inactiveImage;

/**
 *  功能:刷新，会回到第一页
 */
- (void)reloadPageView;
/**
 *	功能:滑动到index页
 *
 *	@param	index 滑动到的目标页，超过或者小于0就不进行任何操作
 */
- (void)scroolToPageIndex:(NSInteger)index;

/**
 *	功能:停止定时滚动
 */
- (void)fireTimer;
/**
 *	功能:开始定时滚动
 */
- (void)startTimer;

/**
 *  获取某个索引位置的视图
 *
 *  @param aIndex 索引
 *
 *  @return 当前View
 */
- (UIView *)viewForIndex:(NSInteger )aIndex;

@end

@protocol NGPageViewDelegate <NSObject>

@optional

- (void)pageView:(NGPageView *)pageView didTouchOnPage:(NSIndexPath *)indexPath;

- (void)pageView:(NGPageView *)pageView didChangeToIndex:(NSInteger)aIndex;

- (void)pageViewWillBeginDecelerating:(NGPageView *)pageView;

/**
 *	功能:pageView滑动结束,即滑动到超过最后一张
 */
- (void)scrollEndOfPageView:(NGPageView *)pageView;

@required
- (UIView *)pageView:(NGPageView *)pageView pageAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfPagesInPageView:(NGPageView *)pageView;

@end
