//
//  OTSFPSLabel.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTSFuncDefine.h"

/**
 Show Screen FPS...
 
 The maximum fps in OSX/iOS Simulator is 60.00.
 The maximum fps on iPhone is 59.97.
 The maxmium fps on iPad is 60.0.
 */

@interface OTSFPSLabel : UILabel

AS_SINGLETON(OTSFPSLabel);

- (void)showBuoyCartWithView:(UIView *)aView;

@end
