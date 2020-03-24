//
//  BaseViewController.m
//  LogDemo
//
//  Created by mumu on 2019/5/18.
//  Copyright © 2019 feiyujie. All rights reserved.
//

#import "MMBaseViewController.h"

@interface MMBaseViewController () <UIGestureRecognizerDelegate>

@end

@implementation MMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self initSubView];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)initSubView {
    
}

- (void)callBasePublic {
    [self callBasePrivate];
}

- (void)callBasePrivate {
    NSLog(@"BaseViewController=%@",self);
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (BOOL)shouldAutorotate {
    return false;
}

#pragma mark - Navigation


@end
