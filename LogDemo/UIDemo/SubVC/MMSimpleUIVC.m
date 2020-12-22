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
#import "MMSImpleXibUIVC.h"
#import "MMCustomTextAttachment.h"
#import "MMTestView.h"

@interface MMSimpleUIVC ()
@property (nonatomic, strong) UILabel *testLabel;

@property (nonatomic, strong) MMCustomButton *customBtn;

@property (nonatomic, strong) MMCustomButton *customeBtn_sub;

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@property (nonatomic, strong) MMCircleView *circleView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIStackView *stackView;

@property (nonatomic, strong) MMTestView *guideView;
@property (nonatomic, strong) UIView *maskView;

@end

@implementation MMSimpleUIVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.testLabel = [[UILabel alloc] init];
//    self.testLabel.numberOfLines = 0;
//    [self.view addSubview:self.testLabel];
//    self.testLabel.layer.cornerRadius = 20;
//    self.testLabel.layer.masksToBounds = 20;
//    self.testLabel.text = @"测试Label测试Label测试Label测试Label测试Label测试Label测试Label测试Label测试Label";
//    CGSize size = [self.testLabel intrinsicContentSize];
////    self.testLabel.size = CGSizeMake(size.width + 20, size.height + 20);
//    self.testLabel.size = size;
//    self.testLabel.center = self.view.center;
//    self.testLabel.backgroundColor = UIColor.cyanColor;
////
//    NSLogSize(size);
    
    //对齐方式测试
    UILabel *customLabel = [[UILabel alloc] init];
    customLabel.numberOfLines = 0;
    customLabel.textAlignment = NSTextAlignmentJustified;
    customLabel.backgroundColor = UIColor.cyanColor;
    customLabel.y = 100 + 50;
//    customLabel.width = 100;
    customLabel.x = 100;
//    customLabel.height = 100;
    customLabel.text = self.testLabel.text;
//    customLabel.layer.cornerRadius = 20;
//    customLabel.layer.masksToBounds = true;
    customLabel.attributedText = [self createAttribute];
    [self.view addSubview:customLabel];
    CGSize labelSize = [customLabel intrinsicContentSize];
    NSLogSize(labelSize);

    customLabel.size = labelSize;
//    _customeBtn_sub = [MMCustomButton new];
//    _customeBtn_sub.frame = CGRectMake(10, 10, 40, 40);
//    _customeBtn_sub.backgroundColor = UIColor.redColor;
//
    [self.view addSubview:self.customBtn];
//    [self.customBtn addSubview:_customeBtn_sub];
    
    
//    self.manager = [[AFHTTPSessionManager alloc] init];
//    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self.manager GET:@"https://www.baidu.com/" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@",[NSThread currentThread]);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"%@",[NSThread currentThread]);
//        }];
//    });
    
//    self.circleView = [[MMCircleView alloc] initWithFrame:CGRectMake(50, 200, 0, 0)];
//    self.circleView.backgroundColor = UIColor.cyanColor;
//    [self.view addSubview:self.circleView];
    
//    UIView *bottom = [[UIView alloc] initWithFrame:CGRectMake(0, 500, ScreenWidth, 200)];
//    bottom.backgroundColor = UIColor.clearColor;
//    UIColor *firstColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.0f];
//    UIColor *endColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
//    [bottom setColors:@[firstColor, endColor] withDirectionType:kGradientColorDirectionTypeVertical];
//    self.bottomView = bottom;
//    [self.view addSubview:bottom];
    
//    [[TimeProfiler shareInstance] TPStopTrace];
    
    self.view.backgroundColor = UIColor.brownColor;
    
//    [self addguide];
}

- (void)addguide {
    UIWindow *window = self.view.window;
//    UIApplication.sharedApplication.delegate.window;
    window = UIApplication.sharedApplication.keyWindow;
    self.guideView.frame = window.bounds;
    [window addSubview:self.guideView];

    UIBezierPath *path = [UIBezierPath bezierPathWithRect:window.bounds];
    [path appendPath:[UIBezierPath bezierPathWithRoundedRect:CGRectMake(100, 100, 100, 100) cornerRadius:0]];
    path.usesEvenOddFillRule = true;
//    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:20 startAngle:0 endAngle:2 * M_PI clockwise:false]];
    
    CAShapeLayer *shaper = [CAShapeLayer layer];
    shaper.cornerRadius = 10;
    shaper.path = path.CGPath;
    shaper.fillRule = kCAFillRuleEvenOdd;

//    shaper.frame = CGRectMake(100, 100, 100, 100);
//    shaper.backgroundColor = UIColor.clearColor.CGColor;
    self.guideView.layer.mask = shaper;
}
static int test = 0;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    if (test >= 5) {
//        test = 0;
//    }
//    self.stackView.distribution = test++;
//    NSLog(@"test=%i",test);
//    if (test == 0) {
//        self.customeBtn_sub.width = 30;
//        test += 1;
//    } else {
//        self.customBtn.width += 50;
//    }
    if (test == 8) {
        test = 0;
    }
    MMSImpleXibUIVC *controller = [MMSImpleXibUIVC new];
    controller.modalPresentationStyle = test;
    NSLog(@"test=%zd",controller.modalPresentationStyle);

    [self.navigationController presentViewController:controller animated:YES completion:nil];
    test += 1;
}
- (NSMutableAttributedString *)createAttribute {
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:@"Start"];
    [attr addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} range:NSMakeRange(0, 5)];
    UIImage *img = [UIImage imageNamed:@"hotel_logo_booking"];
//    MMCustomTextAttachment *attach = [[MMCustomTextAttachment alloc] init];
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    NSLog(@"imgSize = %@",[NSValue valueWithCGSize:img.size]);
    attach.image = img;

    //y值为正  在上方
    attach.bounds = CGRectMake(100, 0, attach.image.size.width + 100, attach.image.size.height);
//    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:img.size];
////    container.
//    UIImage *img2 = [attach imageForBounds:CGRectMake(100, 0, img.size.width, img.size.height) textContainer:container characterIndex:0];
//    NSLog(@"imgSize2 = %@",[NSValue valueWithCGSize:img2.size]);
    NSAttributedString *attr_1 = [NSAttributedString attributedStringWithAttachment:attach];
    [attr appendAttributedString:attr_1];
    
    CGSize size = [attr boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    NSLog(@"attr = %@",attr);
    NSLog(@"attrSize = %@",[NSValue valueWithCGSize:size]);
    return attr;
}
/*
 attach.bounds = CGRectMake(-10, 0, 0, 0);
 2020-11-12 19:07:31.156530+0800 LogDemo[27038:425250] attrSize = NSSize: {37.37841796875, 20.287109375}
 <MMSimpleUIVC.m : 66> -[MMSimpleUIVC viewDidLoad]
 2020-11-12 19:07:31.157195+0800 LogDemo[27038:425250] labelSize w:37.6667, h:20.3333
 Printing description of labelSize:
 (CGSize) labelSize = (width = 37.666666666666664, height = 20.333333333333332)
 
 attach.bounds = CGRectMake(100, 50, attach.image.size.width, attach.image.size.height);
 2020-11-12 19:12:05.174126+0800 LogDemo[27212:430743] imgSize = NSSize: {58, 7.666666666666667}
 <MMSimpleUIVC.m : 143> -[MMSimpleUIVC createAttribute]
 2020-11-12 19:12:05.175902+0800 LogDemo[27212:430743] attrSize = NSSize: {95.37841796875, 61.767252604166664}
 <MMSimpleUIVC.m : 66> -[MMSimpleUIVC viewDidLoad]
 2020-11-12 19:12:05.176537+0800 LogDemo[27212:430743] labelSize w:95.6667, h:62.0000
 */
- (void)p_handleBtnClick:(UIButton *)sender {
    MMSImpleXibUIVC *controller = [MMSImpleXibUIVC new];
    controller.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController presentViewController:controller animated:YES completion:nil];
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
        btn.backgroundColor = UIColor.redColor;
        btn.layer.cornerRadius = 20;
        [btn addTarget:self action:@selector(p_handleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        btn.layer.masksToBounds = true;
        _customBtn = btn;
    }
    return _customBtn;
}


- (void)stackViewTest {
    
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

- (void)handleGesture:(UITapGestureRecognizer *)sender {
    NSLog(@"点击");
}
- (MMTestView *)guideView {
    if (!_guideView) {
        MMTestView *view = [MMTestView new];
//        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        view.backgroundColor = [UIColor mm_colorWithHex:0x000000 alpha:0.5];
        self.maskView = [[UIView alloc] init];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [view addGestureRecognizer:tap];
//        CAShapeLayer *shaper = [CAShapeLayer layer];
//        shaper.cornerRadius = 10;
//        shaper.frame = CGRectMake(100, 100, 100, 100);
//        shaper.backgroundColor = UIColor.clearColor.CGColor;
//        view.layer.mask = shaper;
//        [view.layer addSublayer:shaper];
        _guideView = view;
    }
    return _guideView;
}
@end
