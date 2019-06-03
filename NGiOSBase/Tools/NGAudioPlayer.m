//
//  NGAudioPlayer.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGAudioPlayer.h"

#import <AudioToolBox/AudioToolbox.h>

#import "NGLog.h"

@implementation NGAudioPlayer

+ (void)playSoundWithFileName:(NSString *)aFileName bundleName:(NSString *)aBundleName ofType:(NSString *)ext andAlert:(BOOL)alert
{
    NSBundle *bundle = [NSBundle mainBundle];
    if (aBundleName.length) {
        bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:aBundleName withExtension:@"bundle"]];
    }
    
    if (!bundle) {
        NGLogE(@"play sound cannot find bundle,%@",aBundleName);
        return ;
    }
    
    NSString *path = [bundle pathForResource:aFileName ofType:ext];
    
    if (!path) {
        NGLogE(@"play sound cannot find file [%@] in bundle [%@]",aFileName ,aBundleName);
        return ;
    }
    
    NSURL *urlFile = [NSURL fileURLWithPath:path];
    
    // 声明需要播放的音频文件ID[unsigned long]
    SystemSoundID ID;
    
    // 创建系统声音，同时返回一个ID
    OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)urlFile, &ID);
    
    if (err) {
        NGLogE(@"play sound cannot create file url [%@]",urlFile);
        return ;
    }
    
    // 根据ID播放自定义系统声音
    if (alert) {
        AudioServicesPlayAlertSound(ID);
    }
    else {
        AudioServicesPlaySystemSound(ID);
    }
}

@end
