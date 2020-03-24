//
//  UIView+MMCategory.h
//  LogDemo
//
//  Created by mumu on 2020/1/13.
//  Copyright © 2020 mumu. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MMCategory)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;


@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;


@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGPoint origin;


/// 控件最大Y值
@property (nonatomic, assign) CGFloat maxY;
/// 控件最大X值
@property (nonatomic, assign) CGFloat maxX;

@end

NS_ASSUME_NONNULL_END
