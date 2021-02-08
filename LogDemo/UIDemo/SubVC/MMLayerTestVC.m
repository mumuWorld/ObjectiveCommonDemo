//
//  MMLayerTestVC.m
//  LogDemo
//
//  Created by mumu on 2020/8/21.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMLayerTestVC.h"

@interface MMLayerTestVC ()
@property (weak, nonatomic) IBOutlet UIView *view_1;

/// mastLayer
@property (weak, nonatomic) IBOutlet UIView *view_2;

@end

@implementation MMLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect bounds = _view_1.bounds;
    CGSize size = _view_1.bounds.size;
    _view_1.layer.contentsScale = UIScreen.mainScreen.scale;
    CGFloat scale = _view_1.layer.contentsScale;
//    size.width *= UIScreen.mainScreen.scale;
//    size.height *= UIScreen.mainScreen.scale;

    UIColor *testColor = UIColor.redColor;
    NSLog(@"view_1=%@",[NSValue valueWithCGRect:_view_1.frame]);
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, testColor.CGColor);
    CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _view_1.layer.contents = (__bridge id)image.CGImage;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  {
    
    
    
}

- (void)maskTest {
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRect:_view_2.bounds ];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:_view_2.bounds cornerRadius:10];

    //    UIBezierPath *alpha = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 20, 50, 50) cornerRadius:5];
    //    [path appendPath:alpha];
    //    path.usesEvenOddFillRule = YES;
        
        CAShapeLayer *shaper = [CAShapeLayer layer];
        shaper.path = path.CGPath;
        //奇偶规则 奇数填充 偶数不填充
        shaper.fillRule = kCAFillRuleEvenOdd;
        
        _view_2.layer.mask = shaper;
}

- (void)pointChangeTest {
    NSLogPoint(_view_2.layer.anchorPoint);
    NSLogRect(_view_2.frame);
    NSLogRect(_view_2.layer.frame);

    NSLogRect(_view_2.bounds);
    NSLogRect(_view_2.layer.bounds);

    NSLogPoint(_view_2.center);
    NSLogPoint(_view_2.layer.position);
    
//    CGPoint originalPoistion = _view_2.center;
//    _view_2.center = CGPointMake(originalPoistion.x -10, originalPoistion.y-10);
    
    
    CGPoint originalP = _view_2.layer.anchorPoint;
    _view_2.layer.anchorPoint = CGPointMake(0, 0);
    
    NSLogPoint(_view_2.layer.anchorPoint);
    NSLogRect(_view_2.frame);
    NSLogRect(_view_2.layer.frame);

    NSLogRect(_view_2.bounds);
    NSLogRect(_view_2.layer.bounds);

    NSLogPoint(_view_2.center);
    NSLogPoint(_view_2.layer.position);
}
@end
