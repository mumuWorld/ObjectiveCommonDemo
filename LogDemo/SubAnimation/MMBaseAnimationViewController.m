//
//  MMBaseAnimationViewController.m
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMBaseAnimationViewController.h"

@interface MMBaseAnimationViewController ()

@end

@implementation MMBaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"基础动画";
    
}

- (void)initSubView {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = true;
        self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;

    } else {
        // Fallback on earlier versions
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = false;
        self.navigationController.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAutomatic;

    } else {
        // Fallback on earlier versions
    }
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
