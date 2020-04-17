//
//  MMPresentTestVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMPresentTestVC.h"
#import "MMBaseNavigationController.h"

@interface MMPresentTestVC ()
@property (nonatomic, strong) UIButton *tmpBtn;

@property (nonatomic, strong) UIButton *dismissBtn;

@property (nonatomic, strong) UIButton *addSubVCBtn;

@end

@implementation MMPresentTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.tmpBtn];
    [self.view addSubview:self.dismissBtn];
    [self.view addSubview:self.addSubVCBtn];

    self.tmpBtn.x = 100;
    self.tmpBtn.y = 100;
    self.dismissBtn.x = 100;
    self.dismissBtn.y = 200;
    self.addSubVCBtn.x = 100;
    self.addSubVCBtn.y = 300;
}

- (void)sendClick:(UIButton *)sender {
    if (sender.tag == 11) {
        
        MMPresentTestVC *rootvc = [[MMPresentTestVC alloc] init];
        if (self.navigationController) {
            rootvc.view.backgroundColor = [UIColor blueColor];
            
            [self.navigationController pushViewController:rootvc animated:true];
        } else {
            MMBaseNavigationController *navi = [[MMBaseNavigationController alloc] initWithRootViewController:rootvc];
            navi.modalPresentationStyle = UIModalPresentationFullScreen;
            rootvc.view.backgroundColor = [UIColor redColor];
            
            [self presentViewController:navi animated:true completion:nil];
        }
    } else if(sender.tag == 10) {
        if (self.navigationController) {
            if (self.navigationController.childViewControllers.count == 1) {
                [self.navigationController dismissViewControllerAnimated:true completion:nil];
            } else {
                [self.navigationController popViewControllerAnimated:true];
            }
        } else {
            [self dismissViewControllerAnimated:true completion:nil];
        }
    } else if(sender.tag == 12) { //
                MMPresentTestVC *rootvc = [[MMPresentTestVC alloc] init];
        rootvc.view.backgroundColor = UIColor.greenColor;
        rootvc.view.frame = CGRectMake(0, 100, 100, 100);
        [self addChildViewController:rootvc];
        [self.view addSubview:rootvc.view];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",self);
}

- (UIButton *)tmpBtn {
    if (!_tmpBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"present Or Push页面" forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.tag = 11;
        _tmpBtn = btn;
    }
    return _tmpBtn;
}

- (UIButton *)dismissBtn {
    if (!_dismissBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"消失" forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.tag = 10;
        _dismissBtn = btn;
    }
    return _dismissBtn;
}

- (UIButton *)addSubVCBtn {
    if (!_addSubVCBtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(sendClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"添加子vc" forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.tag = 12;
        _addSubVCBtn = btn;
    }
    return _addSubVCBtn;
}
@end
