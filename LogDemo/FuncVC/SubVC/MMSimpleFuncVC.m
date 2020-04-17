//
//  MMSimpleFuncVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncVC.h"

@interface MMSimpleFuncVC ()

@end

@implementation MMSimpleFuncVC

- (void)viewDidLoad {
    [super viewDidLoad];
        int x = 0;
       // ARC 下定义 normalBlock 后再打印其所在的内存地址
    void(^normalBlock)(void) = ^{
        NSLog(@"%d", x);
    };
    NSLog(@"normalBlock: %@", normalBlock);

    // 直接打印某个 block 的内存地址
    NSLog(@"block: %@", ^{
        NSLog(@"%d", x);
    });
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
