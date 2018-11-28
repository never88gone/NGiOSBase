//
//  OTSPageView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>
//view
#import "OTSScrollView.h"
#import "OTSPageControl.h"

typedef enum _OTSPageViewModeType
{
    KOTSPageViewLandscape = 0      // Portrait
    , KOTSPageViewPortrait        // Landscape
}
OTSPageViewModeType;

@protocol OTSPageViewDelegate;

@interface OTSPageView : UIView<UIScrollViewDelegate>

@property(nonatomic, weak) id<OTSPageViewDelegate> delegate;

@property(nonatomic, assign) NSInteger currentScrollPage;

@property(nonatomic, assign) OTSPageViewModeType mode;

@property(nonatomic, assign)BOOL  continuous; //是否连续滚动,首尾想接

@property(nonatomic, strong, readonly) NSMutableArray *contentViewArray;

/**
 *  获取PageControl
 */
- (OTSPageControl *)getPageControl;

/**
 *	功能:初始化
 *
 *	@param frame
 *	@param aDelegate
 *
 *	@return
 */
- (id)initWithFrame:(CGRect)frame
           delegate:(id<OTSPageViewDelegate>)aDelegate;

/**
 *  功能:初始化方法
 *  返回值:当前对象
 */
- (id)initWithFrame:(CGRect)frame
           delegate:(id<OTSPageViewDelegate>)aDelegate
          sleepTime:(NSInteger)aSleepTime;
/**
 *	功能:设置滑动的PageControl
 */
- (void)setPageControlWithActiveColor:(UIColor *)activeColor
                    withInactiveColor:(UIColor *)inactiveColor;

/**
 *  使用图片,设置滑块
 *
 *  @param activeImage
 *  @param inactiveImage
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
 *	@param	index:滑动到的目标页，超过或者小于0就不进行任何操作
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
 *  @param index
 *
 *  @return
 */
- (UIView *)viewForIndex:(NSInteger )aIndex;

@end

@protocol OTSPageViewDelegate <NSObject>

@optional

- (void)pageView:(OTSPageView *)pageView didTouchOnPage:(NSIndexPath *)indexPath;

- (void)pageView:(OTSPageView *)pageView didChangeToIndex:(NSInteger)aIndex;

- (void)pageViewWillBeginDecelerating:(OTSPageView *)pageView;

/**
 *	功能:pageView滑动结束,即滑动到超过最后一张
 */
- (void)scrollEndOfPageView:(OTSPageView *)pageView;

@required
- (UIView *)pageView:(OTSPageView *)pageView pageAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfPagesInPageView:(OTSPageView *)pageView;

@end
