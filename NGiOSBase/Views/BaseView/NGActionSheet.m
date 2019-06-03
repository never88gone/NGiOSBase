//
//  NGActionSheet.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGActionSheet.h"
//category
#import "NSObject+BeeNotification.h"

@interface NGActionSheet () <UIActionSheetDelegate>

@property (nonatomic, copy) NGActionSheetBlock block;

@end

@implementation NGActionSheet

+ (instancetype)actionSheetWithTitle:(NSString *)aTitle cancelButtonTitle:(NSString *)aCancelButtonTitle destructiveButtonTitle:(NSString *)aDestructiveButtonTitle andCompleteBlock:(NGActionSheetBlock)aBlock
{
    if (!aCancelButtonTitle) {
        aCancelButtonTitle = @"取消";
    }
    
    if (!aDestructiveButtonTitle) {
        aDestructiveButtonTitle = @"确定";
    }
    
    NGActionSheet *actionSheet = [[self alloc] initWithTitle:aTitle delegate:nil cancelButtonTitle:aCancelButtonTitle destructiveButtonTitle:aDestructiveButtonTitle otherButtonTitles:nil];
    
    actionSheet.delegate = actionSheet;
    actionSheet.block = aBlock;
    
    return actionSheet;
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block) {
        self.block((NGActionSheet *)actionSheet, buttonIndex);
    }
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
