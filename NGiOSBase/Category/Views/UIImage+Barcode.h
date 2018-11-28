//
//  UIImage+Barcode.h
//  MySam
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Barcode)

/**
 *  生成条形码
 *  @param content 号码
 *  @param size    图片大小（如果条码的长度比较长，分辨率设置要高一些）
 *  @return 条形码图片
 */
+ (UIImage *)barcodeImageWithContent:(NSString *)content imageSize:(CGSize)size;

@end
