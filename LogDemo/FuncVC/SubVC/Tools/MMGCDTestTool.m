//
//  MMGCDTestTool.m
//  LogDemo
//
//  Created by mumu on 2020/5/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMGCDTestTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation MMGCDTestTool

#pragma mark - dispatch_group_t
/// 0 2  3 func 5 5.1 7 1 4 6
+ (void)gcd_groupTest1 {
    dispatch_group_t group = dispatch_group_create();
    NSLog(@"0");
    dispatch_group_async(group, dispatch_get_main_queue(), ^{
        NSLog(@"1");
    });
    NSLog(@"2");
    dispatch_function_t func = testFunc;
    int testNumber = 10;
    dispatch_group_async_f(group, dispatch_get_global_queue(0, 0), &testNumber, func);
    NSLog(@"3");
    dispatch_group_enter(group);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"4");
        dispatch_group_leave(group);
    });
    NSLog(@"5");
    dispatch_group_wait(group, dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC));
    NSLog(@"5.1");
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
       NSLog(@"6");
    });
    NSLog(@"7");
}

void testFunc(void *context) {
    int *number = context;
    NSLog(@"testFunc-%d",*number);
}

#pragma mark - gcd_barrier
//1/3/2/4[主]/5/6【主】/7/8【主】/9
+ (void)gcd_barrier_test {
    dispatch_queue_t con_q = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");
    dispatch_async(con_q, ^{
        NSLog(@"2");
    });
    NSLog(@"3");
    dispatch_sync(con_q, ^{
        NSLog(@"4=%@",[NSThread currentThread]);
    });
    NSLog(@"5");
    dispatch_sync(con_q, ^{
        NSLog(@"6=%@",[NSThread currentThread]);
    });
    NSLog(@"7");
    dispatch_barrier_sync(con_q, ^{
        //主线程
        NSLog(@"8=%@",[NSThread currentThread]);
    });
    NSLog(@"9");
}

/// 1、3、2、4、5、7、6、9、8
+ (void)gcd_barrier_test_2 {
    dispatch_queue_t con_q = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1");
    dispatch_async(con_q, ^{
        NSLog(@"2");
    });
    NSLog(@"3");
    dispatch_sync(con_q, ^{
        NSLog(@"4"); //主线程
    });
    NSLog(@"5");
    dispatch_async(con_q, ^{
        NSLog(@"6");
    });
    NSLog(@"7");
    dispatch_barrier_async(con_q, ^{
        //子线程
        NSLog(@"8=%@",[NSThread currentThread]);
    });
    NSLog(@"9");
}

/// 0 - 1[main]  - 6/ 2/3 -  5- 4
+ (void)gcd_groupTest2 {
    dispatch_queue_t custom = dispatch_queue_create("mm.custom", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"0-%@",[NSThread currentThread]);
    dispatch_sync(custom, ^{
        NSLog(@"1-%@",[NSThread currentThread]);
        dispatch_async(custom, ^{
            NSLog(@"2-%@",[NSThread currentThread]);
        });
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"3-%@",[NSThread currentThread]);
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), custom, ^{
            NSLog(@"4-%@",[NSThread currentThread]);
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC) , dispatch_get_main_queue(), ^{
            NSLog(@"5-%@",[NSThread currentThread]);
        });
    });
    NSLog(@"6-%@",[NSThread currentThread]);
}

- (void)testInvoke:(void (^)(int type, NSString * msg))back {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_global_queue(0, 0), ^{
        back(1, @"回吊了");
    });
    NSLog(@"函数执行完成");
}

+ (void)queueCreateTest {
    char *name = "com.mumu.queue";
    for (int i = 0; i< 10; i++) {
        //创建一个串行队列。
        dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_USER_INITIATED, 0);
        dispatch_queue_t queue = dispatch_queue_create(name, attr);
        NSLog(@"%@-%p",queue,queue);
    }
}

+ (void)threadTest {
    [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
        NSLog(@"current=%@",[NSThread currentThread]);
//        if (granted) {
//            [self requestSpeechRecognizedPermission];
//        } else {
//            elongAlertAction *action = [elongAlertAction actionWithTitle:@"知道了" style:ElongAlertActionStyle_Cancel handler:nil];
//            [eLongHotelAlertTool showAlertWithTitle:@"未开启麦克风使用权限" message:[NSString stringWithFormat:@"请进入“设置-隐私-麦克风”打开%@的麦克风授权",APP_NAME] alertActions:@[action]];
//        }
    }];
}


+ (void)waitTest {
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t que = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"0");
    dispatch_group_async(group, que, ^{
        NSLog(@"1");
    });
    NSLog(@"2");
    dispatch_group_enter(group);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), que, ^{
        NSLog(@"4");
        dispatch_group_leave(group);
    });
    NSLog(@"5");
    //直接卡死在这步
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"6");
}
@end
