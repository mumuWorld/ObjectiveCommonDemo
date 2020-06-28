//
//  UIView+MMCategory.m
//  LogDemo
//
//  Created by mumu on 2020/1/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "UIView+MMCategory.h"

@implementation UIView (MMCategory)
//@dynamic maxX,maxY;
- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)width {
    return self.bounds.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.bounds.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGSize)size {
    return self.bounds.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)setMaxX:(CGFloat)maxX {
    NSLog(@"don't revoke thie selector");
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (void)setMaxY:(CGFloat)maxY {
    NSLog(@"don't revoke thie selector");
}
@end

@implementation UIView (MMGradientLayer)
+ (Class)layerClass {
    return [CAGradientLayer class];
}

- (CAGradientLayer *)gradientLayer {
    return (CAGradientLayer *)self.layer;
}

- (void)setColors:(NSArray *)colors withDirectionType:(kGradientColorDirectionType)directionType{
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    if (directionType == kGradientColorDirectionTypeVertical) {
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 1);
    }else if (kGradientColorDirectionTypeHorizontal){
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(1, 0);
    }
    self.gradientLayer.colors = cgColors;
}
@end
