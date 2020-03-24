//
//  MMCAReplicatorLayerVC.m
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCAReplicatorLayerVC.h"

@interface MMCAReplicatorLayerVC ()

@property (nonatomic, strong) UIView *testView;

@end

@implementation MMCAReplicatorLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    文档 https://developer.apple.com/documentation/quartzcore/careplicatorlayer
}

- (void)initSubView {
    self.testView.frame = CGRectMake(50, NavigationBarHeight, 300, 100);
    [self.view addSubview:self.testView];
    
    [self createLayer];
}

- (void)createLayer {
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.backgroundColor = UIColor.lightGrayColor.CGColor; //并无效果b
    
    CALayer *redSquare = [CALayer layer];
    redSquare.backgroundColor = UIColor.whiteColor.CGColor;
    redSquare.frame = CGRectMake(0, 0, 50, 50);
    
    CGFloat instanceCount = 5;
    
    replicator.instanceCount = instanceCount;
    replicator.instanceTransform = CATransform3DMakeTranslation(60, 0, 0);
    
    CGFloat offsetStep = -1 / instanceCount;
    replicator.instanceBlueOffset = offsetStep;
    replicator.instanceGreenOffset = offsetStep;
    [replicator addSublayer:redSquare];
    
//    [self.testView.layer addSublayer:replicator];
    
    CAReplicatorLayer *replicator2 = [CAReplicatorLayer layer];
    [replicator2 addSublayer:replicator];
    replicator2.instanceCount = instanceCount;
    replicator2.instanceTransform = CATransform3DMakeTranslation(0, 60, 0);
    replicator2.instanceRedOffset = offsetStep;
    
    [self.testView.layer addSublayer:replicator2];
    
//    CAReplicatorLayer *replicator3 = [CAReplicatorLayer layer];
//    [replicator3 addSublayer:replicator2];
//    replicator3.instanceCount = instanceCount;
//    replicator3.instanceTransform = CATransform3DMakeTranslation(60, 0, 0);
//    replicator3.instanceRedOffset = offsetStep;
    
//[self.testView.layer addSublayer:replicator3];
}

- (UIView *)testView {
    if (!_testView) {
        UIView *tmp = [[UIView alloc] init];
        tmp.backgroundColor = UIColor.cyanColor;
        _testView = tmp;
    }
    return _testView;
}
@end
