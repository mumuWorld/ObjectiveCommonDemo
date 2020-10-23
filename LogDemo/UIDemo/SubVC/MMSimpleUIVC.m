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
#import "MMCircleView.h"
#import "UIView+MMCategory.h"
#import "TimeProfiler.h"

@interface MMSimpleUIVC ()
@property (nonatomic, strong) UILabel *testLabel;

@property (nonatomic, strong) MMCustomButton *customBtn;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) MMCircleView *circleView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIStackView *stackView;
@end

@implementation MMSimpleUIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testLabel = [[UILabel alloc] init];
    self.testLabel.numberOfLines = 0;
    [self.view addSubview:self.testLabel];
    self.testLabel.layer.cornerRadius = 20;
    self.testLabel.layer.masksToBounds = 20;
    self.testLabel.text = @"测试Label测试Label测试Label测试Label测试Label测试Label测试Label测试Label测试Label";
    CGSize size = [self.testLabel intrinsicContentSize];
//    self.testLabel.size = CGSizeMake(size.width + 20, size.height + 20);
    self.testLabel.size = size;
    self.testLabel.center = self.view.center;
    self.testLabel.backgroundColor = UIColor.cyanColor;
//
    NSLogSize(size);
    
    //对齐方式测试
    UILabel *customLabel = [[UILabel alloc] init];
    customLabel.numberOfLines = 0;
    customLabel.textAlignment = NSTextAlignmentJustified;
    customLabel.backgroundColor = UIColor.cyanColor;
    customLabel.y = self.testLabel.y + 50;
    customLabel.width = 100;
    customLabel.x = 100;
    customLabel.height = 100;
    customLabel.text = self.testLabel.text;
    customLabel.layer.cornerRadius = 20;
    customLabel.layer.masksToBounds = true;
    [self.view addSubview:customLabel];
    
    
    
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
    
    self.circleView = [[MMCircleView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
    self.circleView.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:self.circleView];
    
    UIView *bottom = [[UIView alloc] initWithFrame:CGRectMake(0, 500, ScreenWidth, 200)];
    bottom.backgroundColor = UIColor.clearColor;
    UIColor *firstColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.0f];
    UIColor *endColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    [bottom setColors:@[firstColor, endColor] withDirectionType:kGradientColorDirectionTypeVertical];
    self.bottomView = bottom;
    [self.view addSubview:bottom];
    
//    [[TimeProfiler shareInstance] TPStopTrace];
    
    self.view.backgroundColor = UIColor.brownColor;
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.distribution = UIStackViewDistributionEqualCentering;
    stackView.spacing = 10;
    stackView.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:stackView];
    _stackView  = stackView;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"左边btn" forState:UIControlStateNormal];
    [btn setBackgroundColor:UIColor.greenColor];
    [_stackView addArrangedSubview:btn];
    
    UILabel *label = [UILabel new];
    label.backgroundColor = UIColor.redColor;
    label.text = @"这是label";
    [_stackView addArrangedSubview:label];
    
    UIButton *btn_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_2 setTitle:@"右边btn" forState:UIControlStateNormal];
    [btn_2 setBackgroundColor:UIColor.orangeColor];
    [_stackView addArrangedSubview:btn_2];
    
    UIView *view = [UIView new];
    view.backgroundColor = UIColor.blueColor;
    [_stackView addArrangedSubview:view];
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(8);
        make.right.mas_lessThanOrEqualTo(self.view).offset(-8);
        make.top.mas_equalTo(NavigationBarHeight);
        make.height.mas_equalTo(50);
    }];
    
    [label setContentHuggingPriority:600 forAxis:UILayoutConstraintAxisHorizontal];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(20);
        make.height.mas_offset(10);
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
    }];
    [btn_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(50);
    }];
}

static int test = 0;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (test >= 5) {
        test = 0;
    }
    self.stackView.distribution = test++;
    NSLog(@"test=%i",test);
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
