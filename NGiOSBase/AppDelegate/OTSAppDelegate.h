//
//  OTSAppDelegate.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTSWindow.h"

@interface OTSAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) OTSWindow *window;
@property (nonatomic, strong) OTSWindow *pcWindow;
@property (nonatomic, strong) OTSWindow *topWindow;

- (void)endEditing;

@end
