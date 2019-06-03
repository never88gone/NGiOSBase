//
//  NGAppDelegate.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGAppDelegate.h"

#import "NGNotificationDefine.h"
//tools
#import "NGLog.h"
//define
#import "NGMacroDefine.h"
#import "NGTopWindow.h"
#import <SDWebImage/SDWebImageManager.h>
#ifndef DEBUG

#endif




@interface NGAppDelegate ()

@end

@implementation NGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
#ifndef DEBUG

    
#endif
    
    //pc window
    self.pcWindow = [[NGWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.pcWindow.backgroundColor = [UIColor clearColor];
    self.pcWindow.windowLevel = UIWindowLevelNormal + 1;
    self.pcWindow.rootViewController = [UIViewController new];
    [self.pcWindow makeKeyAndVisible];
    self.pcWindow.hidden = YES;
    
    //for 轮播图等促销
    self.topWindow = [[NGTopWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.topWindow.backgroundColor = [UIColor clearColor];
    self.topWindow.windowLevel = UIWindowLevelAlert + 1;
    self.topWindow.rootViewController = [UIViewController new];
    [self.topWindow makeKeyAndVisible];
    self.topWindow.hidden = YES;
    
    
    //setup SDImageCache
    [SDImageCache sharedImageCache].config.maxCacheSize  = 50 * 1024 * 1024;//50MB
    [SDImageCache sharedImageCache].maxMemoryCost = 50 * 1024 * 1024;//50MB
    
    //setup log
    [NGLog setupLogerStatus];

    //show status bar
    [application setStatusBarHidden:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NGLogFuncI;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NGLogFuncI;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NGLogFuncI;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NGLogFuncI;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NGLogFuncE;
}

- (void)endEditing
{
    [self.window endEditing:YES];
}


@end
