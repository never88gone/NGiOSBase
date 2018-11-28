//
//  OTSSegmentView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSView.h"

#import "OTSSegmentBtnView.h"

@class OTSSegmentView;

@protocol OTSSegmentViewDelegate <NSObject>

- (NSInteger)numberOfSegmentBtnInSegment:(OTSSegmentView *)aView;

- (void)segment:(OTSSegmentView *)aView didSelectedIndex:(NSInteger)aIndex;

- (void)segment:(OTSSegmentView *)aView configSegmentBtn:(OTSSegmentBtnView *)aBtnView atIndex:(NSInteger)aIndex;

@end

@interface OTSSegmentView : OTSView

@property (nonatomic, weak) id <OTSSegmentViewDelegate> delegate;

@property (nonatomic) NSInteger selectedIndex;

- (void)reloadData;

@end
