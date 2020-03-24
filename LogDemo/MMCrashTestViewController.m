//
//  MMCrashTestViewController.m
//  LogDemo
//
//  Created by mumu on 2020/1/6.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCrashTestViewController.h"

@interface MMCrashTestViewController ()

@end

@implementation MMCrashTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)crash_01 {
    //    [__NSCFNumber bytes]: unrecognized selector sent to instance 0xb668757ef8c5082a'
    id testData = [NSNumber numberWithInt:123];
    id obj = [NSKeyedUnarchiver unarchiveObjectWithData:testData];
    NSLog(@"obj=%@",obj);
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
