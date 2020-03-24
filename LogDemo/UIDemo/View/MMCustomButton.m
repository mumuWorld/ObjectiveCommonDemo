//
//  MMCustomButton.m
//  LogDemo
//
//  Created by mumu on 2020/3/3.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCustomButton.h"

@implementation MMCustomButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{

    BOOL  flag = [super pointInside:point withEvent:event];
    if (flag) {
        //圆形点击范围
        UIBezierPath   *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
        if ([path containsPoint:point]) {
            return YES;
        }
    }
    return NO;

}


@end
