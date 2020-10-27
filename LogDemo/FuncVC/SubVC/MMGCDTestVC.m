//
//  MMGCDTestVC.m
//  LogDemo
//
//  Created by mumu on 2020/5/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMGCDTestVC.h"
#import "MMGCDTestTool.h"

@interface MMGCDTestVC ()
@property (weak, nonatomic) IBOutlet UIButton *test1;

@end

@implementation MMGCDTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)handleBtnClick:(UIButton *)sender {
    if (sender.tag == 10) {
        [MMGCDTestTool gcd_groupTest1];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"self=%@",self);
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
