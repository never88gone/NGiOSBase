//
//  NGAppDelegate.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NGWindow.h"

@interface NGAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) NGWindow *window;
@property (nonatomic, strong) NGWindow *pcWindow;
@property (nonatomic, strong) NGWindow *topWindow;

- (void)endEditing;

@end
