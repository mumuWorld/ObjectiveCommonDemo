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
    [self collision];
}

- (void)gravity {
    
    //仿真行为
    UIGravityBehavior *beha = [[UIGravityBehavior alloc] initWithItems:@[self.img_1,self.img_2]];
    //设置重力行为的方向 (数值越大加速度越大)
    beha.gravityDirection = CGVectorMake(10, 10);
    //角度
    beha.angle = M_PI;
    //速度  角度+ 速度= gravityDirection
    beha.magnitude = 10;;
    
    [_ani addBehavior:beha];
}

/// 碰撞
- (void)collision {
    //仿真行为
    UICollisionBehavior *beha = [[UICollisionBehavior alloc] initWithItems:@[self.img_1,self.img_2]];
    beha.translatesReferenceBoundsIntoBoundary = true;
    [_ani addBehavior:beha];
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
