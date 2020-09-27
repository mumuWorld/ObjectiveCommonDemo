//
//  MMLayerTestViewController.m
//  LogDemo
//
//  Created by mumu on 2019/12/27.
//  Copyright © 2019 mumu. All rights reserved.
//

#import "MMLayerTestViewController.h"
#import "MMContentView.h"

@interface MMLayerTestViewController () 
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@property (nonatomic, strong) MMContentView *contentView;

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
    
    self.contentView = [[MMContentView alloc] init];
//    self.contentView.backgroundColor = UIColor.blueColor;
    MMRadiusConfigure *configure = [[MMRadiusConfigure alloc] init];
    configure.rectCorner = UIRectCornerTopLeft | UIRectCornerTopRight;
    configure.cornerRaidus = 8;
    self.contentView.frame = CGRectMake(100, 300, 100, 100);
    self.contentView.configure = configure;
    [self.view addSubview:self.contentView];
    
    UIView *top = [[UIView alloc] init];
    top.frame = CGRectMake(50, 0, 100, 100);
    top.backgroundColor = UIColor.blueColor;
    [self.contentView addSubview:top];
    self.contentView.layer.masksToBounds = true;
    
    configure.cornerRaidus = 50;
    self.contentView.configure = configure;
}


#pragma mark - getter && setter
- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer = [CAShapeLayer layer];
    }
    return _shapeLayer;
}


@end
