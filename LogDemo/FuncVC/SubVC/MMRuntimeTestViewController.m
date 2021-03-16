//
//  MMRuntimeTestViewController.m
//  LogDemo
//
//  Created by mumu on 2021/1/27.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMRuntimeTestViewController.h"
#import "MMRuntimeTest.h"


@interface MMRuntimeTestViewController ()
@property (nonatomic, strong) MMRuntimeTest *testModel;
@end

@implementation MMRuntimeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MMRuntimeTest *test = [MMRuntimeTest new];
    test.test = @"tesst";
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)handleBtnClick:(UIButton *)sender {
    if (sender.tag == 10) { //未实现方法
//        @autoreleasepool {
        [self.testModel unImplementMethod];
//        }
//        [MMGCDTestTool gcd_groupTest1];
    } else if (sender.tag == 11) { //栅栏
        [self.testModel kindTest];
    } else if (sender.tag == 12) { //栅栏
    }
}

- (MMRuntimeTest *)testModel {
    if (!_testModel) {
        _testModel = [MMRuntimeTest new];
    }
    return _testModel;
}
@end
