//
//  MMTimeOffsetViewController.m
//  LogDemo
//
//  Created by mumu on 2020/9/28.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMTimeOffsetViewController.h"

@interface MMTimeOffsetViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation MMTimeOffsetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.layer.position = CGPointMake(0, self.imageView.bounds.size.height * 0.5);
    self.imageView.layer.anchorPoint = CGPointMake(0, 0.5);
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -0.1 / 500.0;
    self.imageView.layer.transform = perspective;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    
    [self.view addGestureRecognizer:pan];
    
    self.imageView.layer.speed = 0.0;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 1.0;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

- (void)pan:(UIPanGestureRecognizer *)pan{
    CGFloat x = [pan translationInView:self.view].x;
    x /= 200.0f;
    CFTimeInterval timeOffset = self.imageView.layer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    self.imageView.layer.timeOffset = timeOffset;
    [pan setTranslation:CGPointZero inView:self.view];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
