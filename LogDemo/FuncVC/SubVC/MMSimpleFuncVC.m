//
//  MMSimpleFuncVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncVC.h"
#import "MMPresentTestVC.h"

@interface MMSimpleFuncVC ()

@end

@implementation MMSimpleFuncVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self testFuncA];
}

- (void)testBLock {
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

- (void)testFuncA {
    NSLog(@"a");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MMPresentTestVC *test = [[MMPresentTestVC alloc] init];
    test.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController presentViewController:test animated:true completion:nil];
}

@end
