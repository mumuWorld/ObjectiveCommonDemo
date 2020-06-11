//
//  MMMasonryViewController.m
//  LogDemo
//
//  Created by mumu on 2019/12/26.
//  Copyright © 2019 mumu. All rights reserved.
//

#import "MMMasonryViewController.h"
#import <Masonry.h>

@interface MMMasonryViewController ()
@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) UIView *botView;

@property (nonatomic, strong) MASConstraint *botView_top;
@end

@implementation MMMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.botView];
    [self addConstaint];
}

- (void)dealloc {
    NSLog(@"释放");
}
- (void)addConstaint {
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view).offset(40 + 100);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(100));
    }];
    
    [self.botView mas_makeConstraints:^(MASConstraintMaker *make) {
        self.botView_top = make.top.equalTo(self.topView).offset(60);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(50));
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.botView_top uninstall];
//    [self.botView mas_updateConstraints:^(MASConstraintMaker *make) {
////        make.top.equalTo(self.view).offset(100);
//        make.top.equalTo(self.topView).offset(100);
//    }];
    [self.botView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.height.equalTo(@(50));
    }];
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}
#pragma mark - getter && setter
- (UIView *)topView {
    if (!_topView) {
        _topView = [[UIView alloc] initWithFrame:CGRectZero];
        _topView.backgroundColor = UIColor.redColor;
    }
    return _topView;
}

- (UIView *)botView {
    if (!_botView) {
        _botView = [[UIView alloc] initWithFrame:CGRectZero];
        _botView.backgroundColor = UIColor.blueColor;
    }
    return _botView;
}

@end
