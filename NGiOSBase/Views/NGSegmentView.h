//
//  NGSegmentView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGView.h"

#import "NGSegmentBtnView.h"

@class NGSegmentView;

@protocol NGSegmentViewDelegate <NSObject>

- (NSInteger)numberOfSegmentBtnInSegment:(NGSegmentView *)aView;

- (void)segment:(NGSegmentView *)aView didSelectedIndex:(NSInteger)aIndex;

- (void)segment:(NGSegmentView *)aView configSegmentBtn:(NGSegmentBtnView *)aBtnView atIndex:(NSInteger)aIndex;

@end

@interface NGSegmentView : NGView

@property (nonatomic, weak) id <NGSegmentViewDelegate> delegate;

@property (nonatomic) NSInteger selectedIndex;

- (void)reloadData;

@end
