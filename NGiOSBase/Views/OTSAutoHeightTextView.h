//
//  OTSAutoHeightTextView.h
//  OneStorePad
//
//  Created by 刘巧毅 on 15/5/25.
//  Copyright (c) 2015年 OneStore. All rights reserved.
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
