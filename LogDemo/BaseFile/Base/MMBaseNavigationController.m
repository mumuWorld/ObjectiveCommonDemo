//
//  MMBaseNavigationController.m
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMBaseNavigationController.h"

@interface MMBaseNavigationController ()

@end

@implementation MMBaseNavigationController

//是否隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return self.topViewController.prefersStatusBarHidden;
}

- (BOOL)shouldAutorotate {
    NSLog(@"调用是否shouldAutorotate");
    [NSObject new];
    return self.topViewController.shouldAutorotate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    viewController.hidesBottomBarWhenPushed = true;
    [super pushViewController:viewController animated:animated];
}

@end
