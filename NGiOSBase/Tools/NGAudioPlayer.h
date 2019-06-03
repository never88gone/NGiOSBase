//
//  NGAudioPlayer.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

@interface NGAudioPlayer : NSObject

+ (void)playSoundWithFileName:(NSString *)aFileName
                   bundleName:(NSString *)aBundleName
                       ofType:(NSString *)ext
                     andAlert:(BOOL)alert;

@end
