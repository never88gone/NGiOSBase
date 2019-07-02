//
//  NGAutoHeightTextView.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "NGAutoHeightTextView.h"
@implementation NGAutoHeightTextView

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
