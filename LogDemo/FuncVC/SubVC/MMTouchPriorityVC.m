//
//  MMTouchPriorityVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMTouchPriorityVC.h"
#import "MMTouchView.h"

@interface MMTouchPriorityVC ()
@property (weak, nonatomic) IBOutlet MMTouchView *bgView_A;
@property (weak, nonatomic) IBOutlet MMTouchView *subView_B;
@property (weak, nonatomic) IBOutlet MMTouchView *subView_B_2;
@property (weak, nonatomic) IBOutlet MMTouchView *subVIew_C;

@property (weak, nonatomic) IBOutlet UIButton *btn_B;
@property (weak, nonatomic) IBOutlet UIButton *btn_C;
@property (weak, nonatomic) IBOutlet UIButton *btn_C_2;
@property (weak, nonatomic) IBOutlet UIButton *btn_B_2;

@property (nonatomic, strong) UIView *subview_C_2;

@property (nonatomic, strong) UIControl *subview_C_A_1;

@end

@implementation MMTouchPriorityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.subview_C_2 = [[UIView alloc] init];
    self.subview_C_2.tag = 24;
    self.subview_C_2.frame = CGRectMake(0, 0, 50, 50);
    self.subview_C_2.backgroundColor = [UIColor blueColor];
    [self.btn_B_2 addSubview:self.subview_C_2];
    
    _subview_C_A_1 = [[UIControl alloc] initWithFrame:CGRectMake(0, 300, 25, 25)];
    _subview_C_A_1.backgroundColor = UIColor.cyanColor;
    [_subview_C_A_1 addTarget:self action:@selector(handleControl:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_subview_C_A_1];

    NSArray *arr = @[_bgView_A,_subView_B,_subView_B_2,_subVIew_C,_subview_C_2];
    for (UIView *view in arr) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGes:)];
        tap.delegate = self;
        [view addGestureRecognizer:tap];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touchesBegan");
}

- (void)handleControl:(UIControl *)sender {
    NSLog(@"handleControl");
}

- (IBAction)handleBtnClick:(UIButton *)sender {
    NSLog(@"sender.tag-%zd",sender.tag);
}

- (void)handleTapGes:(UITapGestureRecognizer *)tap {
    UIView *view = tap.view;
     NSLog(@"view.tag-%zd",view.tag);
}

- (UIResponder *)nextResponder {
    UIResponder *respon = [super nextResponder];
    return self.navigationController;
}
@end
