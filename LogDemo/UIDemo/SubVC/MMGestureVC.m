//
//  MMGestureVC.m
//  LogDemo
//
//  Created by mumu on 2021/2/8.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMGestureVC.h"
#import "MMTouchView.h"
#import "MMTouchButton.h"
#import "MMTouchControl.h"
#import "MMLayerTestViewController.h"

@interface MMGestureVC ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn_1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@property (strong, nonatomic) UITextView *textView;
@end

@implementation MMGestureVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    UITapGestureRecognizer *tap_0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    UIPanGestureRecognizer *tap_0 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:tap_0];
    
    //判断手势和target的优先级
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
//    tap.cancelsTouchesInView = false;
    [self.btn_1 addGestureRecognizer:tap];
    
    //子视图手势 和 父视图target优先级
    MMTouchView *view_2 = [MMTouchView new];
    view_2.backgroundColor = UIColor.yellowColor;
    view_2.frame = CGRectMake(0, 0, 50, 50);
    view_2.tag = 1000;
    UITapGestureRecognizer *tap_2 = [[UITapGestureRecognizer alloc] initWithTarget:view_2 action:@selector(handleGesture:)];
    tap_2.cancelsTouchesInView = false;
    [view_2 addGestureRecognizer:tap_2];
    [self.btn2 addSubview:view_2];
    
    MMTouchControl *subbtn_3 = [MMTouchControl new];
    subbtn_3.backgroundColor = UIColor.redColor;
    subbtn_3.frame = CGRectMake(0, 0, 50, 50);
    subbtn_3.tag = 1001;
    UITapGestureRecognizer *tap_3 = [[UITapGestureRecognizer alloc] initWithTarget:subbtn_3 action:@selector(handleGesture:)];
    [subbtn_3 addGestureRecognizer:tap_3];
    [self.btn3 addSubview:subbtn_3];
    
    //1 按钮中有taget 和手势时， 手势优先响应
    //2 按钮子视图中有手势， 子视图手势优先响应
    
    
    MMLayerTestViewController *vc = [[MMLayerTestViewController alloc] init];
    [self addChildViewController:vc];
    vc.view.frame = CGRectMake(10, 300, 300, 300);
    vc.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    
//    [vc.view addSubview:self.textView];
    [self.view addSubview:self.textView];
    [self.textView becomeFirstResponder];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view);
        make.top.equalTo(self.view).offset(250);
        make.height.mas_equalTo(100);
    }];
    
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.view).inset(20);
        make.height.mas_equalTo(300);
        make.top.equalTo(self.textView.mas_top).offset(10);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"发送2");
        [self removeChildVC];
    });
}

- (void)removeChildVC {
    MMLayerTestViewController *vc = self.childViewControllers.firstObject;
//    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
//    [vc removeFromParentViewController];
    NSLog(@"已经移除");
}

- (void)handleGesture:(UIGestureRecognizer *)sender {
    NSLog(@"view.tag=%zd, state=%zd",sender.view.tag, sender.state);
}

- (IBAction)clickBtn:(UIButton *)sender {
    NSLog(@"%@",sender.titleLabel.text);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@",event);
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%zd",event.type);
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%zd",event.type);
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%zd",event.type);
}

- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"输入中-%@-%@",textView.text,textView.markedTextRange);
    
}

- (UITextView *)textView {
    if(!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 350, 350, 100)];
        _textView.backgroundColor = [UIColor grayColor];
        _textView.delegate = self;
    }
    return _textView;
}
@end
