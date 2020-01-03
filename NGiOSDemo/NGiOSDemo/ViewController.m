//
//  ViewController.m
//  NGiOSDemo
//
//  Created by never88gone on 2020/1/3.
//  Copyright © 2020 NGiOS. All rights reserved.
//

#import "ViewController.h"
#import <NGiOSBase/NGiOSBase.h>
#import <BlocksKit/BlocksKit.h>
@interface ViewController ()
@property (nonatomic,weak) IBOutlet UIButton* btn_test;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btn_test bk_whenTapped:^{
        
    }];
}


@end
