//
//  NGSegmentBtnView.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGSegmentBtnView : UIButton

@property (nonatomic,strong) UILabel *textLbl;
@property (nonatomic,strong) UILabel *numLbl;

- (void)updateLabels;

@end
