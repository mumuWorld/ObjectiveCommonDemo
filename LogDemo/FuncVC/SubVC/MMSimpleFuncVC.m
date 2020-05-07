//
//  MMSimpleFuncVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/17.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSimpleFuncVC.h"
#import "MMPresentTestVC.h"
#import "MMSimpleFuncModel.h"

@interface MMSimpleFuncVC ()

@end

@implementation MMSimpleFuncVC

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self testFuncA];
    [self test2];
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

- (void)test2 {
    MMSimpleFuncModel *model_1 = [[MMSimpleFuncModel alloc] init];
    model_1.keyType = @"beddesc";
    model_1.content = @"c1";
    MMSimpleFuncModel *model_2 = [[MMSimpleFuncModel alloc] init];
    model_2.keyType = @"multibed";
    model_2.content = @"c2";
    NSArray *array = @[@{@"keyType":@"beddesc",
                         @"content":@"c1",
                         @"type": @(1)
    },
                       @{@"keyType":@"multibed",
                         @"content":@"c1",
                         @"type": @(1)
                       }];
    NSArray *array_2 = @[model_1,model_2];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"keyType = %@ || keyType = %@",@"beddesc",@"multibed"];
    
    NSPredicate *pre_2 = [NSPredicate predicateWithFormat:@"type = %d",1];
    NSPredicate *pre_5 = [NSPredicate predicateWithFormat:@"type == %d",1];

//    NSArray <MMSimpleFuncModel>*array = @[model_1,model_2];
    NSPredicate *pre_3 = [NSPredicate predicateWithFormat:@"type == 1"];
    NSPredicate *pre_4 = [NSPredicate predicateWithFormat:@"type = 1"];

//    NSArray *result = [self.hotelDetailModel.otherText filteredArrayUsingPredicate:pre];
    
    NSArray *result = [array filteredArrayUsingPredicate:pre];
    NSArray *result_2 = [array_2 filteredArrayUsingPredicate:pre];
    NSArray *result_3 = [array filteredArrayUsingPredicate:pre_2];
    NSArray *result_4 = [array filteredArrayUsingPredicate:pre_3];
    NSArray *result_5 = [array filteredArrayUsingPredicate:pre_4];
    NSArray *result_6 = [array filteredArrayUsingPredicate:pre_5];

    NSLog(@"%@--%@",result,result_2);
}
@end
