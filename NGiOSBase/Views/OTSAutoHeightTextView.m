//
//  OTSAutoHeightTextView.m
//  OneStorePad
//
//  Created by 刘巧毅 on 15/5/25.
//  Copyright (c) 2015年 OneStore. All rights reserved.
//

#import "OTSAutoHeightTextView.h"
#import "UITextView+Placeholder.h"

@implementation OTSAutoHeightTextView

@dynamic delegate;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       // [self initUI];
    }
    return self;
}



- (void)setContentSize:(CGSize)contentSize {
    CGSize oriSize = self.contentSize;
    
    CGSize newSize = contentSize;
    newSize.height = MAX(contentSize.height, self.minHeight);
    
    if (oriSize.height != newSize.height) {
        CGRect newFrame = self.frame;
        newFrame.size.height = newSize.height;
        self.frame = newFrame;
        
        if ([self.delegate respondsToSelector:@selector(textView:didChangedHeight:newHeight:)]) {
            [self.delegate textView:self didChangedHeight:newSize.height-oriSize.height newHeight:newSize.height];
        }
        
        if (self.heightChangedBlock) {
            self.heightChangedBlock(newSize.height-oriSize.height, newSize.height);
        }
    }
    
    [super setContentSize:contentSize];
}

@end
