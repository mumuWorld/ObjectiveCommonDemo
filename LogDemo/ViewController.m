//
//  ViewController.m
//  LogDemo
//
//  Created by feiyujie on 2016/12/26.
//  Copyright © 2016年 feiyujie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self callBasePublic];
    self.view.layer.cornerRadius = 0.5;
    self.view.layer.masksToBounds = YES;
    
}

- (void)callBasePrivate {
    NSLog(@"ViewController - callBasePrivate=%@",self);
}
//- (void)initSubView {
//    NSLog(@"ViewController=%@",self);
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
