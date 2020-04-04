//
//  MMSimpleUIVC.m
//  LogDemo
//
//  Created by mumu on 2020/3/3.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleUIVC.h"
#import "MMCustomButton.h"
#import <AFNetworking/AFNetworking.h>

@interface MMSimpleUIVC ()
@property (nonatomic, strong) UILabel *testLabel;

@property (nonatomic, strong) MMCustomButton *customBtn;

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation MMSimpleUIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testLabel = [[UILabel alloc] init];
    [self.view addSubview:self.testLabel];
    
    self.testLabel.text = @"测试Label";
    CGSize size = [self.testLabel intrinsicContentSize];
    self.testLabel.size = CGSizeMake(size.width + 20, size.height + 20);
    self.testLabel.center = self.view.center;
    self.testLabel.backgroundColor = UIColor.cyanColor;
    NSLogSize(size);
    
    [self.view addSubview:self.customBtn];
    self.manager = [[AFHTTPSessionManager alloc] init];
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self.manager GET:@"https://www.baidu.com/" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",[NSThread currentThread]);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",[NSThread currentThread]);
        }];
    });
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"1");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"2");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"4");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"5");
}
- (MMCustomButton *)customBtn {
    if (!_customBtn) {
        MMCustomButton *btn = [[MMCustomButton alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
        [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
        _customBtn = btn;
    }
    return _customBtn;
}
@end
