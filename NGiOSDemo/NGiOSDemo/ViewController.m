//
//  ViewController.m
//  NGiOSDemo
//
//  Created by never88gone on 2020/1/3.
//  Copyright © 2020 NGiOS. All rights reserved.
//

#import "ViewController.h"
#import <NGiOSBase/NGiOSBase.h>
#import <BlocksKit/BlocksKit+UIKit.h>
@interface ViewController ()
@property (nonatomic,weak) IBOutlet UIButton* btn_test;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn_test bk_addEventHandler:^(id sender) {
        if (IS_IPHONE_6_5_LAND) {
            NSLog(@"%@",@"IS_IPHONE_6_5");
        }else if (IS_IPHONE_6_1_LAND) {
            NSLog(@"%@",@"IS_IPHONE_6_1");
        }else if (IS_IPHONE_5_8_LAND) {
            NSLog(@"%@",@"IS_IPHONE_5_8");
        }
    } forControlEvents:UIControlEventTouchUpInside];
}


@end
