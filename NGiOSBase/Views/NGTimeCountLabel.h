//
//  NGTimeCountLabel.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NGTimeCountLabelDelegate <NSObject>
@required
- (void)timeDrained;
@end

@interface NGTimeCountLabel : UILabel

@property(nonatomic, weak) id<NGTimeCountLabelDelegate> delegate;
@property(nonatomic, strong)NSString *timeFormat;
/**
 *  功能：设置倒计时时间，time单位为毫秒
 */
- (void)setCountDownTime:(SInt64)time;

/**
 *  功能：设置倒计时的时间，time单位是秒
 */
- (void)setCountDownSecTime:(SInt64)time;
@end
