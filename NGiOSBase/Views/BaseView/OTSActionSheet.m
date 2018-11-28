//
//  OTSActionSheet.m
//  OneStoreFramework
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "OTSActionSheet.h"
//category
#import "NSObject+BeeNotification.h"

@interface OTSActionSheet () <UIActionSheetDelegate>

@property (nonatomic, copy) OTSActionSheetBlock block;

@end

@implementation OTSActionSheet

+ (instancetype)actionSheetWithTitle:(NSString *)aTitle cancelButtonTitle:(NSString *)aCancelButtonTitle destructiveButtonTitle:(NSString *)aDestructiveButtonTitle andCompleteBlock:(OTSActionSheetBlock)aBlock
{
    if (!aCancelButtonTitle) {
        aCancelButtonTitle = @"取消";
    }
    
    if (!aDestructiveButtonTitle) {
        aDestructiveButtonTitle = @"确定";
    }
    
    OTSActionSheet *actionSheet = [[self alloc] initWithTitle:aTitle delegate:nil cancelButtonTitle:aCancelButtonTitle destructiveButtonTitle:aDestructiveButtonTitle otherButtonTitles:nil];
    
    actionSheet.delegate = actionSheet;
    actionSheet.block = aBlock;
    
    return actionSheet;
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block) {
        self.block((OTSActionSheet *)actionSheet, buttonIndex);
    }
}

- (void)dealloc
{
    [self unobserveAllNotifications];
}

@end
