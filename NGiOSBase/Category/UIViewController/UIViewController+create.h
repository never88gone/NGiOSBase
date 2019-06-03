//
//  UIViewController+create.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (create)

#pragma mark - create
/**
 *  从xib创建vc
 *
 *  @return NGVC
 */
+ (instancetype)createFromXib;
/**
 *  从xib创建vc
 *
 *  @param aBundleName res bundle name，NibName = self.class
 *
 *  @return NGVC
 */
+ (instancetype)createFromXibWithBundleName:(NSString *)aBundleName NS_DEPRECATED_IOS(6_0,7_0,"Pad的资源已经合并到Application Target中，不需要从bundle中取出来，请使用不带bundle的方法");
/**
 *  从xib创建vc
 *
 *  @param aNibName xib名称
 *
 *  @return NGVC
 */
+ (instancetype)createFromXibWithNibName:(NSString *)aNibName;
/**
 *  从xib创建vc
 *
 *  @param aNibName  xib名称
 *  @param aBundleName  bundle名称
 *
 *  @return NGVC
 */
+ (instancetype)createFromXibWithNibName:(NSString *)aNibName bundleName:(NSString *)aBundleName;
/**
 *  从storyboard创建vc
 *
 *  @return NGVC
 */

+ (instancetype)createFromStoryboard;
/**
 *  从storyboard创建vc
 *
 *  @param aStoryboardName Storyboard名称
 *
 *  @return NGVC
 */
+ (instancetype)createFromStoryboardWithStoryboardName:(NSString *)aStoryboardName;
/**
 *  @param aStoryboardID Storyboardid
 *  @param aStoryboardName  Storyboard名称
 *
 *  @return NGVC
 */
+ (instancetype)createFromStoryboardWithStoryboardID:(NSString *)aStoryboardID storyboardName:(NSString *)aStoryboardName;
/**
 *  从storyboard创建vc
 *
 *  @param aStoryboardName Storyboard名称
 *  @param aBundleName  bundle名称
 *
 *  @return NGVC
 */
+ (instancetype)createFromStoryboardWithStoryboardName:(NSString *)aStoryboardName bundleName:(NSString *)aBundleName;
/**
 *  @param aBundleName res bundle name，storyboardID = self.class
 *
 *  @return NGVC
 */
+ (instancetype)createFromStoryboardWithStoryboardID:(NSString *)aStoryboardID storyboardName:(NSString *)aStoryboardName bundleName:(NSString *)aBundleName;
@end
