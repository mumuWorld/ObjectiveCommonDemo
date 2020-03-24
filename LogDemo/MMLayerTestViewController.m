//
//  MMLayerTestViewController.m
//  LogDemo
//
//  Created by mumu on 2019/12/27.
//  Copyright © 2019 mumu. All rights reserved.
//

#import "MMLayerTestViewController.h"

@interface MMLayerTestViewController () 
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation MMLayerTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    _topView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _topView.backgroundColor = UIColor.cyanColor;
//    _topView.center = CGPointMake(200, 300);
    
    
    [self.view addSubview:_topView];
    NSLog(@"%@",[NSValue valueWithCGPoint:_topView.center]);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 50, 50)];
    self.shapeLayer.path = path.CGPath;
    [self.topView.layer addSublayer:self.shapeLayer];
    self.shapeLayer.frame = CGRectMake(10, 20, 30, 30);
//    self.shapeLayer.fillColor = UIColor.redColor.CGColor;
    self.shapeLayer.strokeColor = UIColor.greenColor.CGColor;
    self.shapeLayer.strokeStart = 0.2;
    self.shapeLayer.strokeEnd = 0.4;
    self.shapeLayer.lineWidth = 10;
    self.shapeLayer.borderWidth = 5;
    NSLog(@"%@",self.shapeLayer);
    

}


#pragma mark - getter && setter
- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}


@end
