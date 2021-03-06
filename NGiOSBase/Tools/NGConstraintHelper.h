//
//  NGConstraintHelper.h
//  NGiOSBase
//
//  Created by never88gone on 18-01-01.
//  Copyright (c) 2018年 NGiOSBase. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NGConstraintHelper : NSObject

/**
 *  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview;

/*  设置view的大小同父view大小
*
*  @param aSuperview 父view
*  @param aView      需要设置的view
*  @param aInsets    相对于父view的缩进
*/
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets;

/*  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 *  @param aInsets    相对于父view的缩进
 *  @param propert    缩进的优先级
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets propert:(CGFloat)property;

/*  设置view的大小同父view大小
 *
 *  @param aSuperview 父view
 *  @param aView      需要设置的view
 *  @param aInsets    相对于父view的缩进
 *  @param properts   各方向缩进的优先级
 */
+ (void)setView:(UIView *)aView fullAsSuperview:(UIView *)aSuperview andEdgeInsets:(UIEdgeInsets)aInsets propertys:(UIEdgeInsets)propertys;

/**
 *  aViews等分aSuperview的宽或者高
 *
 *  @param aViews  aViews
 *  @param aSuperview aSuperview
 *  @param isHorizontal  isHorizontal
 */
+ (void)setViews:(NSArray *)aViews equalToSuperview:(UIView *)aSuperview isHorizontal:(BOOL)isHorizontal;

/**
 *  测试View是否有错误的约束
 *
 */
+ (void)testAmbiguity:(UIView *)aView;

@end
