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
    if (frame.size.width == 0 && frame.size.height == 0) {
            frame.size = CGSizeMake(100, 100);
        }
    self = [super initWithFrame:frame];
    NSLog(@"%@",self);
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, rect.size.width - 20, rect.size.height - 40)];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, UIColor.blueColor.CGColor);
    
    CGContextSetLineWidth(context, 5);
    
    CGContextAddPath(context, path.CGPath);

    CGContextStrokePath(context);
    
    CGContextAddPath(context, path.CGPath);
    
    CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);
    

    CGContextFillPath(context);
        
}


@end
