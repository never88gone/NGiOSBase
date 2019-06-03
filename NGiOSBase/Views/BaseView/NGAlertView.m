//
//  NGAlertView.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGAlertView.h"

@interface NGAlertView () <UIAlertViewDelegate>


@end

@implementation NGAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (instancetype)alertWithMessage:(NSString *)aMessage andCompleteBlock:(NGAlertViewBlock)aBlock
{
    return [self alertWithTitle:nil message:aMessage andCompleteBlock:aBlock];
}

+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage andCompleteBlock:(NGAlertViewBlock)aBlock
{
    return [self alertWithTitle:aTitle message:aMessage leftBtn:@"确定" rightBtn:nil extraData:nil andCompleteBlock:aBlock];
}

+ (instancetype)alertWithTitle:(NSString *)aTitle message:(NSString *)aMessage leftBtn:(NSString *)leftBtnName rightBtn:(NSString *)rightBtnName extraData:(id)aData andCompleteBlock:(NGAlertViewBlock)aBlock
{
    if (!leftBtnName) {
        leftBtnName = @"确定";
    }
    
    if (!aTitle) {
        aTitle = @"";
    }
    
    NGAlertView *alertView = nil;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        alertView = [[NGAlertView alloc] init];
       
        // 不知道下面三个参数干什么用
        alertView.data = aData;
        alertView.block = aBlock;
        alertView.delegate = alertView;
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:aTitle message:aMessage preferredStyle:UIAlertControllerStyleAlert];
        
        if (leftBtnName) {
            UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:leftBtnName style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                if (aBlock) {
                    aBlock(alertView,0);
                }
            }];
            [alertController addAction:cancelButton];
        }
        
        if (rightBtnName) {
            UIAlertAction *okButton = [UIAlertAction actionWithTitle:rightBtnName style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                if (aBlock) {
                    aBlock(alertView,1);
                }
            }];
            
            [alertController addAction:okButton];
        }
        
        [[[NGAlertView window] rootViewController] presentViewController:alertController animated:YES completion:nil];
        return nil;
    } else {
        alertView = [[self alloc] initWithTitle:aTitle message:aMessage delegate:nil cancelButtonTitle:leftBtnName otherButtonTitles:nil];
        
        alertView.delegate = alertView;
        
        if (rightBtnName) {
            [alertView addButtonWithTitle:rightBtnName];
        }
        
        alertView.data = aData;
        alertView.block = aBlock;
        alertView.delegate = alertView;
    }
    
    return alertView;
}

+ (UIWindow *) window {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window  == nil) {
        if ([[UIApplication sharedApplication].delegate respondsToSelector:@selector(window)]) {
            window = [[UIApplication sharedApplication].delegate window];
        }
    }
    
    return window;
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(NGAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block) {
        self.block(alertView,buttonIndex);
    }
    
    self.block = nil;
}


@end
