//
//  UILabel+Attribute.m
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import "UILabel+Attribute.h"
//category
#import "NSDictionary+safe.h"
#import "NSString+safe.h"
#import "NSArray+safe.h"

@implementation UILabel (Attribute)

- (void)setText:(NSString *)text AColorTextArray:(NSArray *)actArray AColor:(UIColor*)acolor AFont:(UIFont*)afont
{
    UIFont *lbfont = self.font;
    UIFont *nfont = afont;
    if (afont == nil) {
        nfont = self.font;
    }
    NSDictionary *attrdic = [NSDictionary safeDictionaryWithObject:lbfont forKey:NSFontAttributeName];
    NSMutableAttributedString *nattrStr = [[NSMutableAttributedString alloc]initWithString: text attributes:attrdic];
    
    for (int i = 0 ; i< [actArray count]; i++) {
        NSRange crange = [text safeRangeOfString:[actArray safeObjectAtIndex:i]];
        [nattrStr addAttribute:NSForegroundColorAttributeName value:acolor range:crange];
        [nattrStr addAttribute:NSFontAttributeName value:nfont range:crange];
    }
    
    self.attributedText = nattrStr;
}

@end
