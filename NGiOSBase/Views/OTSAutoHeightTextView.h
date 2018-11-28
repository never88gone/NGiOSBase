//
//  OTSAutoHeightTextView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

@class OTSAutoHeightTextView;

typedef void(^HeightChangedBlock)(NSInteger changedHeight, NSInteger newHeight);

@protocol OTSAutoHeightTextViewDelegate <NSObject>

@optional
- (void)textView:(OTSAutoHeightTextView *)textView didChangedHeight:(NSInteger)changedHeight newHeight:(NSInteger)newHeight;

@end

@interface OTSAutoHeightTextView : UITextView

@property (assign, nonatomic) CGFloat minHeight;

@property (weak, nonatomic) id<UITextViewDelegate, OTSAutoHeightTextViewDelegate> delegate;
@property (copy, nonatomic) HeightChangedBlock heightChangedBlock;

@end
