//
//  OTSAppDelegate.m
//  OneStoreFramework
//
//  Created by Aimy on 14-6-23.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSAppDelegate.h"

#import "OTSNotificationDefine.h"
//tools
#import "OTSLog.h"

//define
#import "OTSMacroDefine.h"

#ifndef DEBUG

#endif


#import "OTSTopWindow.h"

@interface OTSAppDelegate ()

@end

@implementation OTSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
#ifndef DEBUG

    
#endif
    
    //pc window
    self.pcWindow = [[OTSWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.pcWindow.backgroundColor = [UIColor clearColor];
    self.pcWindow.windowLevel = UIWindowLevelNormal + 1;
    self.pcWindow.rootViewController = [UIViewController new];
    [self.pcWindow makeKeyAndVisible];
    self.pcWindow.hidden = YES;
    
    //for 轮播图等促销
    self.topWindow = [[OTSTopWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.topWindow.backgroundColor = [UIColor clearColor];
    self.topWindow.windowLevel = UIWindowLevelAlert + 1;
    self.topWindow.rootViewController = [UIViewController new];
    [self.topWindow makeKeyAndVisible];
    self.topWindow.hidden = YES;
    
    
    //setup SDImageCache
    [SDImageCache sharedImageCache].maxCacheSize  = 50 * 1024 * 1024;//50MB
    [SDImageCache sharedImageCache].maxMemoryCost = 50 * 1024 * 1024;//50MB
    
    //setup log
    [OTSLog setupLogerStatus];

    //show status bar
    [application setStatusBarHidden:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    OTSLogFuncI;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    OTSLogFuncI;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    OTSLogFuncI;
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    OTSLogFuncI;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    OTSLogFuncE;
}

- (void)endEditing
{
    [self.window endEditing:YES];
}


@end
