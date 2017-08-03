//
//  OTSContainerController.h
//  OneStorePad
//
//  Created by Aimy on 3/23/15.
//  Copyright (c) 2015 OneStore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+base.h"

@interface OTSContainerController : UIViewController

//call child view controllers life cycle methods
- (void)callChildVCsViewWillAppear:(BOOL)animated;
- (void)callChildVCsViewDidAppear:(BOOL)animated;
- (void)callChildVCsViewWillDisappear:(BOOL)animated;
- (void)callChildVCsViewDidDisappear:(BOOL)animated;

@end
