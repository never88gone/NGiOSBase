//
//  OTSAppDelegate.h
//  OneStoreFramework
//
//  Created by Aimy on 14-6-23.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OTSWindow.h"

@interface OTSAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) OTSWindow *window;
@property (nonatomic, strong) OTSWindow *pcWindow;
@property (nonatomic, strong) OTSWindow *topWindow;

- (void)endEditing;

@end
