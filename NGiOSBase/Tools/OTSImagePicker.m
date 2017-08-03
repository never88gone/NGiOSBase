//
//  OTSImagePicker.m
//  OneStore
//
//  Created by zhangbin on 14-7-10.
//  Copyright (c) 2014年 OneStore. All rights reserved.
//

#import "OTSImagePicker.h"
#import "OTSFuncDefine.h"
//view
#import "OTSAlertView.h"
#import <MobileCoreServices/UTCoreTypes.h>
@interface OTSImagePicker()<AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession *captureSession;
@property (nonatomic, copy) void(^handler)(NSString *resultString);

@end

@implementation OTSImagePicker

+ (void)shootPictureWithTarget:(id)target{
    [OTSImagePicker getMediaFromSource:UIImagePickerControllerSourceTypeCamera target:target];
}

+ (void)selectExistingPictureWithTarget:(id)target{
    [OTSImagePicker getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary target:target];
}

+ (void)pickImageByMethod:(PickImageMethod)pickImageMethod presentedViewController:(UIViewController *)presentedViewController didFinishHandler:(PickerDidFinishHandler)didFinishHandler cancelHandler:(PickerCancelHandler)cancelHandler{
    if (pickImageMethod == PickImageMethodShootPicture)
    {
        [self shootPictureWithPresentedViewController:presentedViewController didFinishHandler:didFinishHandler cancelHandler:cancelHandler];
    }
    else
    {
        [self selectExistingPictureWithPresentedViewController:presentedViewController didFinishHandler:didFinishHandler cancelHandler:cancelHandler];
    }
}

+ (void)shootPictureWithPresentedViewController:(UIViewController *)presentedViewController didFinishHandler:(PickerDidFinishHandler)didFinishHandler cancelHandler:(PickerCancelHandler)cancelHandler{
    [OTSImagePicker getMediaFromSource:UIImagePickerControllerSourceTypeCamera presentedViewController:presentedViewController didFinishHandler:didFinishHandler cancelHandler:cancelHandler];
}

+ (void)selectExistingPictureWithPresentedViewController:(UIViewController *)presentedViewController didFinishHandler:(PickerDidFinishHandler)didFinishHandler cancelHandler:(PickerCancelHandler)cancelHandler{
    [OTSImagePicker getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary presentedViewController:presentedViewController didFinishHandler:didFinishHandler cancelHandler:cancelHandler];
}

/**
 *  获取图像
 *
 *  @param sourceType 获取途径
 */
+ (void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType target:(id)target {
    NSArray *mediaTypes=@[(NSString *)kUTTypeImage];
    if ([OTSImagePicker validateCameraFromSource:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = target;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [target presentViewController:picker animated:YES completion:nil];
    }
}

/**
 *  获取图像
 *
 *  @param sourceType 获取途径
 */
+ (void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType presentedViewController:(UIViewController *)presentedViewController didFinishHandler:(PickerDidFinishHandler)didFinishHandler cancelHandler:(PickerCancelHandler)cancelHandler {
    NSArray *mediaTypes=@[(NSString *)kUTTypeImage];
    if ([OTSImagePicker validateCameraFromSource:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [picker setBk_didCancelBlock:^(UIImagePickerController *picker) {
            if (cancelHandler) {
                cancelHandler(picker);
            }
        }];
        [picker setBk_didFinishPickingMediaBlock:^(UIImagePickerController *picker, NSDictionary *info) {
            UIImage *chosenImage = [info objectForKey:UIImagePickerControllerEditedImage];
            if (didFinishHandler) {
                didFinishHandler(picker, chosenImage);
            }
        }];
        
        [presentedViewController presentViewController:picker animated:YES completion:nil];
    }
}

/**
 *  验证相机状态
 */
+ (BOOL)validateCameraFromSource:(UIImagePickerControllerSourceType)sourceType
{
    //相机访问被关闭
    BOOL isCameraValid = YES;
    if (IOS_SDK_MORE_THAN(7.0) && (sourceType == UIImagePickerControllerSourceTypeCamera)) {//拍照权限
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if ((authStatus == AVAuthorizationStatusDenied)||(authStatus == AVAuthorizationStatusRestricted)){
            isCameraValid=NO;
        }
    }
    NSArray *mediaTypes=@[(NSString *)kUTTypeImage];//相册不需要判断权限，系统会自动提示，这里是获取是否设备支持
    if (![UIImagePickerController isSourceTypeAvailable:sourceType]||([mediaTypes count] <= 0)) {
        isCameraValid=NO;
    }
    if (!isCameraValid) {
        [[OTSAlertView alertWithTitle:@"未获得相机授权"
                              message:@"请在手机的“设置-隐私-相机”中打开1号店访问相机的权限"
                     andCompleteBlock:nil] show];
    }
    return isCameraValid;
}

+ (OTSImagePicker *)startReadingInView:(UIView *)view handler:(void(^)(NSString *resultString))handler {
    OTSImagePicker *imagePicker = [OTSImagePicker new];
    
    //session
    AVCaptureSession *captureSession = [[AVCaptureSession alloc] init];
    [captureSession setSessionPreset:AVCaptureSessionPresetHigh];
    
    //intput
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:nil];
    [captureSession addInput:input];
    
    if (!input) {
        return nil;
    }
    
    //output
    AVCaptureMetadataOutput *captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [captureSession addOutput:captureMetadataOutput];
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);
    [captureMetadataOutput setMetadataObjectsDelegate:imagePicker queue:dispatchQueue];
    [captureMetadataOutput setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode39Mod43Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeAztecCode]];
    //中间矩形区域实际扫描（y,x,height,width）稍微少一点，防用户呆
    captureMetadataOutput.rectOfInterest=CGRectMake(0.3,0.2,0.4, 0.6);
    
    // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
    AVCaptureVideoPreviewLayer *videoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:captureSession];
    [videoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    // 初始化的时候判断是否为横竖屏
    if ([UIDevice currentDevice].orientation==1||[UIDevice currentDevice].orientation==2){// 竖屏
        [videoPreviewLayer setFrame:CGRectMake(0, 0, 768, 1024)];
        videoPreviewLayer.connection.videoOrientation = [UIDevice currentDevice].orientation==1?1:2;
    }else if([[UIApplication sharedApplication] statusBarOrientation]==3||[[UIApplication sharedApplication] statusBarOrientation]==4){// 横屏
        [videoPreviewLayer setFrame:CGRectMake(0, 0, 1024, 768)];
        videoPreviewLayer.connection.videoOrientation = [UIDevice currentDevice].orientation==3?3:4;
    }else{
        [videoPreviewLayer setFrame:view.layer.bounds];
    }
    
    [view.layer addSublayer:videoPreviewLayer];
    
    // Start video capture.
    [captureSession startRunning];
    
    imagePicker.captureSession = captureSession;
    imagePicker.handler = handler;
    
    return imagePicker;
}

- (void)stopReading
{
    [self.captureSession stopRunning];
}

- (void)resumeReading
{
    [self.captureSession startRunning];
}

+ (BOOL)validateCameraWithCompletion:(void(^)(void))completion
{
    //相机访问被关闭
    BOOL isCameraValid = YES;
    if (IOS_SDK_MORE_THAN(7.0)) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if ((authStatus == AVAuthorizationStatusDenied)||(authStatus == AVAuthorizationStatusRestricted)){
            isCameraValid=NO;
        }
    }
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        isCameraValid=NO;
    }
    if (!isCameraValid) {
        OTSAlertView *alertView = [[OTSAlertView alloc] initWithTitle:@"未获得相机授权"
                                                              message:@"请在手机的“设置-隐私-相机”中打开1号店访问相机的权限"
                                                             delegate:nil
                                                    cancelButtonTitle:@"取消"
                                                    otherButtonTitles:@"去设置",nil];
        
        alertView.delegate = alertView;
        alertView.block = ^(OTSAlertView *alertView, NSInteger buttonIndex) {
            if(buttonIndex==0) {
                
            } else if (buttonIndex==1) {
                NSURL *url = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
        };
        
        [alertView show];
    }
    return isCameraValid;
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate method implementation
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        // Get the metadata object.
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        if ([metadataObj isKindOfClass:[AVMetadataMachineReadableCodeObject class]]) {//排除人脸识别            
            if (self.handler) {
                self.handler(metadataObj.stringValue);
            }
        }
    }
}

@end
