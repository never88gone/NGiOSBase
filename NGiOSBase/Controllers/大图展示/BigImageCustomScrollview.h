//
//  BigImageCustomScrollview.h
//  OneStoreBase
//
//  Created by HU on 16/4/20.
//  Copyright © 2016年 OneStoreBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol bigImageScrollDelegate <NSObject>

-(void)sendBackDissVC;

@end

@interface BigImageCustomScrollview : UIScrollView

@property (nonatomic,assign)id<bigImageScrollDelegate>bigImageDelegate;

@property (nonatomic,strong)UIImageView *imageView;

- (void)updateWithDeafaultImageUrl:(NSString *)defaultUrl
               highQualityImageURL:(NSString *)highQualityImageURL;

@end
