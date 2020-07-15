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

//渐变的方向
typedef NS_ENUM(NSUInteger,kGradientColorDirectionType) {
    kGradientColorDirectionTypeVertical, // 垂直竖向
    kGradientColorDirectionTypeHorizontal, // 水平横向
};

@interface UIView (MMGradientLayer)
- (void)setColors:(NSArray *)colors withDirectionType:(kGradientColorDirectionType)directionType;

- (void)setColors:(NSArray *)colors locations:(NSArray *)locations withDirectionType:(kGradientColorDirectionType)directionType;

@end
NS_ASSUME_NONNULL_END
