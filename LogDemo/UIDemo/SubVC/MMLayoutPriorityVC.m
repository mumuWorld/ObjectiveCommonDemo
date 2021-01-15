//
//  MMLayoutPriorityVC.m
//  LogDemo
//
//  Created by mumu on 2020/8/11.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMLayoutPriorityVC.h"

@interface MMLayoutPriorityVC ()
@property (weak, nonatomic) IBOutlet UIView *organgeView;
@property (weak, nonatomic) IBOutlet UIView *purpleView;
@property (weak, nonatomic) IBOutlet UIButton *simpleBtn;

@end

@implementation MMLayoutPriorityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGRect orgage = self.organgeView.frame;
    CGRect purple = self.purpleView.frame;
    CGRect purpose = [self.organgeView convertRect:self.purpleView.frame toView:self.view.window];
    CGRect purpose_2 = [self.organgeView convertRect:self.purpleView.bounds toView:self.view.window];
    CGRect purpose_3 = [self.organgeView.window convertRect:self.purpleView.frame fromView:self.organgeView];
    CGRect purpose_4 = [self.organgeView.window convertRect:self.purpleView.bounds fromView:self.organgeView];
    
    CGRect purpose_5 = [self.view convertRect:self.purpleView.frame toView:self.view.window];
    
    NSLog(@"joeLog->test=%@",self);
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
