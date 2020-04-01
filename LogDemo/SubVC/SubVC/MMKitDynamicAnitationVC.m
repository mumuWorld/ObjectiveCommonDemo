//
//  MMKitDynamicAnitationVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/1.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMKitDynamicAnitationVC.h"

@interface MMKitDynamicAnitationVC ()

@property (nonatomic, strong) UIView *leftView;

@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UIDynamicAnimator *animator_1;
@property (nonatomic, strong) UIDynamicAnimator *animator_2;

@end

@implementation MMKitDynamicAnitationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAnimtaion];
}

- (void)initSubView {
    UIView *left = [UIView new];
    left.backgroundColor = UIColor.grayColor;
    left.frame = CGRectMake(10, 64, 50, 50);
    self.leftView = left;
    [self.view addSubview:self.leftView];
    
    UIView *right = [UIView new];
    right.backgroundColor = UIColor.greenColor;
    right.frame = CGRectMake(150, 64, 50, 50);
    self.rightView = right;
    [self.view addSubview:self.rightView];
}

- (void)setupAnimtaion {
    UIDynamicAnimator *dynamic_1 = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    //加入重力行为
    UIGravityBehavior *behavior_1 = [[UIGravityBehavior alloc] initWithItems:@[self.leftView]];
    [dynamic_1 addBehavior:behavior_1];
    self.animator_1 = dynamic_1;
    
    UIDynamicAnimator *dynamic_2 = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *behavior_2 = [[UIGravityBehavior alloc] initWithItems:@[self.rightView]];
    [dynamic_2 addBehavior:behavior_2];
    
    //加入重力边界
    UICollisionBehavior *collision_2 = [[UICollisionBehavior alloc] initWithItems:@[self.rightView]];
    collision_2.translatesReferenceBoundsIntoBoundary = true;
    [dynamic_2 addBehavior:collision_2];
    //加入弹性行为
    UIDynamicItemBehavior *item_2 = [[UIDynamicItemBehavior alloc] initWithItems:@[self.rightView]];
    item_2.elasticity = 0.75;
    [dynamic_2 addBehavior:item_2];
    self.animator_2 = dynamic_2;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.leftView.frame = CGRectMake(10, 64, 50, 50);
    self.rightView.frame = CGRectMake(150, 64, 50, 50);
    [self setupAnimtaion];
//    self.animator_1 = nil;
//    self.animator_2 = nil;
}
@end
