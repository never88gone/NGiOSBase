//
//  OTSSegmentView.h
//  OneStoreFramework
//
//  Created by Aimy on 14/12/1.
//  Copyright (c) 2014年 OneStore. All rights reserved.
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
