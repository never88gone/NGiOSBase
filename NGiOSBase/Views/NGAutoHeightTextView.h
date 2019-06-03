//
//  NGAutoHeightTextView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

@class NGAutoHeightTextView;

typedef void(^HeightChangedBlock)(NSInteger changedHeight, NSInteger newHeight);

@protocol NGAutoHeightTextViewDelegate <NSObject>

@optional
- (void)textView:(NGAutoHeightTextView *)textView didChangedHeight:(NSInteger)changedHeight newHeight:(NSInteger)newHeight;

@end

@interface NGAutoHeightTextView : UITextView

@property (assign, nonatomic) CGFloat minHeight;

@property (weak, nonatomic) id<UITextViewDelegate, NGAutoHeightTextViewDelegate> delegate;
@property (copy, nonatomic) HeightChangedBlock heightChangedBlock;

@end
