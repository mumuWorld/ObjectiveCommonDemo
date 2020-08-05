//
//  MMUIDynamicVC.m
//  LogDemo
//
//  Created by World on 2020/7/28.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMUIDynamicVC.h"

@interface MMUIDynamicVC ()
@property (weak, nonatomic) IBOutlet UIImageView *img_1;
@property (weak, nonatomic) IBOutlet UIImageView *img_2;

@property (nonatomic, strong) UIDynamicAnimator *ani;

@end

@implementation MMUIDynamicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建物理仿真器
    self.ani = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self push];
    [self gravity];
    [self collision];
    CGPoint point = [touches.anyObject locationInView:self.view];
    [self snap:point];
}

- (void)gravity {
    
    //仿真行为
    UIGravityBehavior *beha = [[UIGravityBehavior alloc] initWithItems:@[self.img_1]];
    //设置重力行为的方向 (数值越大加速度越大)
    beha.gravityDirection = CGVectorMake(10, 10);
    //角度
//    beha.angle = M_PI;
    //速度  角度+ 速度= gravityDirection
    beha.magnitude = 10;;
    
    [_ani addBehavior:beha];
}

/// 碰撞
- (void)collision {
    //仿真行为
    UICollisionBehavior *beha = [[UICollisionBehavior alloc] initWithItems:@[self.img_1,self.img_2]];
    //碰撞边界
    beha.translatesReferenceBoundsIntoBoundary = true;
    // items 只碰撞元素 Boundaries 只碰撞边界 everying 碰撞任何东西
    beha.collisionMode = UICollisionBehaviorModeItems;
    //边界内边距
//    beha.translatesReferenceBoundsIntoBoundary =
    //添加一个边界
    [beha addBoundaryWithIdentifier:@"ab" fromPoint:CGPointMake(0, 100) toPoint:CGPointMake(self.view.width, 100)];
    //设置碰撞监听代理
    beha.collisionDelegate = self;
    [_ani addBehavior:beha];
}
 
- (void)push {
    //推  Continuous 一直推  Instantaneous 推一次
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.img_2] mode:UIPushBehaviorModeContinuous];
    
    [_ani addBehavior:push];
}

- (void)snap:(CGPoint)point {
    //如果想要多次捕捉行为 需要移除上次行为
    [_ani removeAllBehaviors];
    //创建捕捉行为
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.img_2 snapToPoint:point];
    snap.damping = 0.3;
    [_ani addBehavior:snap];
}
@end
