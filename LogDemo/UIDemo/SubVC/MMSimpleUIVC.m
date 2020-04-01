//
//  MMSimpleUIVC.m
//  LogDemo
//
//  Created by mumu on 2020/3/3.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleUIVC.h"

@interface MMSimpleUIVC ()
@property (nonatomic, strong) UILabel *testLabel;
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
