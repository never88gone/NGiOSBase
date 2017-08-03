//
//  OTSImagePicker.h
//  OneStore
//
//  Created by zhangbin on 14-7-10.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef NS_ENUM(NSInteger, PickImageMethod)
{
    PickImageMethodShootPicture,
    PickImageMethodSelectExistingPicture
};

typedef void(^PickerDidFinishHandler)(UIImagePickerController *picker, UIImage *image);
typedef void(^PickerCancelHandler)(UIImagePickerController *picker);

@interface OTSImagePicker : NSObject

/**
 *  拍照
 *
 *  @param target
 */
+ (void)shootPictureWithTarget:(id)target;

/**
 *  选图片
 *
 *  @param target
 */
+ (void)selectExistingPictureWithTarget:(id)target;

/**
 *  选取照片
 *
 *  @param pickImageMethod  选取方式
 *  @param presentedViewController           目标
 *  @param didFinishHandler 成功
 *  @param cancelHandler    取消
 */
+ (void)pickImageByMethod:(PickImageMethod)pickImageMethod presentedViewController:(UIViewController *)presentedViewController didFinishHandler:(PickerDidFinishHandler)didFinishHandler cancelHandler:(PickerCancelHandler)cancelHandler;

/**
 *  开启扫描扫码
 *
 *  @param view    呈现的视图
 *  @param handler
 *
 *  @return
 */
+ (OTSImagePicker *)startReadingInView:(UIView *)view handler:(void(^)(NSString *resultString))handler;

/**
 *  停止扫描二维码
 */
- (void)stopReading;

/**
 *  继续扫描二维码
 */
- (void)resumeReading;

/**
 *  验证相机状态
 */
+ (BOOL)validateCameraWithCompletion:(void(^)(void))completion;

@end
