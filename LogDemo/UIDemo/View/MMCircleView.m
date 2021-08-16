//
//  MMCircleView.m
//  LogDemo
//
//  Created by World on 2020/4/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCircleView.h"

@implementation MMCircleView

- (instancetype)initWithFrame:(CGRect)frame {
    NSLog(@"%@",self);
//    if (frame.size.width == 0 && frame.size.height == 0) {
//            frame.size = CGSizeMake(100, 100);
//        }
    self = [super initWithFrame:frame];
    NSLog(@"%@",self);
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawBgColor:context];
    [self drawPercentCircle:context];
    
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, rect.size.width - 20, rect.size.height - 40)];
//
//
//    CGContextSetStrokeColorWithColor(context, UIColor.blueColor.CGColor);
//
//
//    CGContextSetLineWidth(context, 5);
//
//    CGContextAddPath(context, path.CGPath);
//
//    CGContextStrokePath(context);
//
//    CGContextAddPath(context, path.CGPath);
//
//    CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);
//
//
//    CGContextFillPath(context);
    
    
        
}
- (void)drawBgColor:(CGContextRef)context {
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextAddRect(context, CGRectMake(0, 0, self.size.width, self.size.height));
    CGContextFillPath(context);
}

- (void)drawPercentCircle:(CGContextRef)context {
    NSArray *arr = @[@(0.4),@(0.3), @(0.2),@(0.1)];
    NSArray *colors = @[UIColor.redColor, UIColor.greenColor, UIColor.grayColor, UIColor.yellowColor];
    CGPoint center = CGPointMake(50, 50);
    CGFloat circleDegree = M_PI * 2;
    CGFloat startAngle = -M_PI_2;
    CGFloat lastAngle = startAngle;

    int curIndex = 0;
    for (UIColor *color in colors) {
        
        CGFloat percent = [arr[curIndex] floatValue];
        CGFloat curPercent = lastAngle +  percent * circleDegree;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:self.cur_raidus startAngle:lastAngle endAngle:curPercent clockwise: YES];
        CGContextSetStrokeColorWithColor(context, color.CGColor);

        CGContextSetLineWidth(context, self.cur_width);
        CGContextAddPath(context, path.CGPath);
        lastAngle = curPercent;
        curIndex += 1;
        CGContextStrokePath(context);
    }
    
    
}


@end
