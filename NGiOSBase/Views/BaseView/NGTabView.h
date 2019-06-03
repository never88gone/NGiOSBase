//
//  NGTabView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NGTabView;

@protocol NGTabViewDelegate <NSObject>

- (void)tabView:(NGTabView *)aTabView changeToIndex:(int)aIndex;

@end

@interface NGTabView : UIView

@property(nonatomic, assign) NSInteger currentIndex;
@property(nonatomic, strong) UIView* backgroundView;

@property(nonatomic, strong) NSMutableArray* imageViews;

@property(nonatomic, strong) NSArray *normalImages;
@property(nonatomic, strong) NSArray *selImages;

@property(nonatomic, strong) NSMutableArray* labels;
@property(nonatomic, assign) CGSize imageSize;

@property(nonatomic, assign) BOOL imageSizeToFit; //

@property(nonatomic, weak) id<NGTabViewDelegate> delegate;
@property(nonatomic, copy) NSString *imgBundleName;

- (id)initWithFrame:(CGRect)frame
              texts:(NSArray *)aArray
              color:(UIColor *)aColor
               font:(UIFont *)aFont
       normalImages:(NSArray *)bArray
          selImages:(NSArray *)cArray;

/**
 *  功能:更新View的label的文字内容
 */
- (void)updateWithTextAry:(NSArray *)aTextAry;

/**
 *  功能:选中某个tab
 */
- (void)selectIndex:(NSInteger)index;



@end
