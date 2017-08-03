//
//  OTSSegmentBtnView.h
//  OneStoreFramework
//
//  Created by Aimy on 14/12/1.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTSSegmentBtnView : UIButton

@property (nonatomic,strong) UILabel *textLbl;
@property (nonatomic,strong) UILabel *numLbl;

- (void)updateLabels;

@end
