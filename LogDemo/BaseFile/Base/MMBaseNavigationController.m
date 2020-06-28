//
//  MMBaseNavigationController.m
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMBaseNavigationController.h"

@interface MMBaseNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation MMBaseNavigationController

//是否隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return self.topViewController.prefersStatusBarHidden;
}

- (BOOL)shouldAutorotate {
    NSLog(@"调用是否shouldAutorotate");
    return self.topViewController.shouldAutorotate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.delegate = self;
    }
    self.delegate = self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
         self.interactivePopGestureRecognizer.enabled = NO;
      }
    viewController.hidesBottomBarWhenPushed = true;
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        if (self.viewControllers.count > 1){
            self.interactivePopGestureRecognizer.enabled = YES;
        }
        else{
            self.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"拦截---%@",gestureRecognizer);
    //判断为右滑手势
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]){
        NSLog(@"拦截2---%@",gestureRecognizer);
    }
    if ( gestureRecognizer == self.interactivePopGestureRecognizer ){
        if ( self.viewControllers.count < 2 || self.visibleViewController == [self.viewControllers objectAtIndex:0] ){
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
     NSLog(@"拦截3---%@",gestureRecognizer);
    /******MODIFY for IBU ******/
    //这里要return NO，否则UIScreenEdgePanGestureRecognizer会使RCTTouchHandler失败导致RN页面返回按钮第一次点击无效
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:NSClassFromString(@"RCTTouchHandler")]) {
        NSLog(@"拦截4---%@",gestureRecognizer);

        return NO;
    }
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
    
}
@end
