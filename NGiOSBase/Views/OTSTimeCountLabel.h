//
//  OTSTimeCountLabel.h
//  OneStoreFramework
//
//  Created by 薛翔 on 14-9-16.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OTSTimeCountLabelDelegate <NSObject>
@required
- (void)timeDrained;
@end

@interface OTSTimeCountLabel : UILabel

@property(nonatomic, weak) id<OTSTimeCountLabelDelegate> delegate;
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
