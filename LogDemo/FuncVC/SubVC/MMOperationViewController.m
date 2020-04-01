//
//  MMOperationViewController.m
//  LogDemo
//
//  Created by mumu on 2020/4/1.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMOperationViewController.h"

@interface MMOperationViewController ()
@property (nonatomic, strong) UIButton *blockOperation;
@property (nonatomic, strong) UIButton *priorityOperationBtn;
@property (nonatomic, strong) UIButton *queueBtn;

@property (nonatomic, strong) NSBlockOperation *blockO;

@property (nonatomic, strong) NSInvocationOperation *invocationO;

@end

@implementation MMOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initSubView {
    self.blockOperation = [self createBtn:@"block测试" tag:1];
    self.blockOperation.x = 10;
    self.blockOperation.y = NavigationBarHeight;
    [self.view addSubview:self.blockOperation];
    
    self.priorityOperationBtn = [self createBtn:@"优先级测试" tag:2];
    self.priorityOperationBtn.x = 10 + CGRectGetMaxX(self.blockOperation.frame);
    self.priorityOperationBtn.y = NavigationBarHeight;
    [self.view addSubview:self.priorityOperationBtn];
    
    self.queueBtn = [self createBtn:@"queue测试" tag:3];
    self.queueBtn.x = 10 + CGRectGetMaxX(self.priorityOperationBtn.frame);
    self.queueBtn.y = NavigationBarHeight;
    [self.view addSubview:self.queueBtn];
}

- (void)handleBtnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
        {
            self.blockO = [NSBlockOperation blockOperationWithBlock:^{
                NSLog(@"NSBlockOperation--1");
            }];
            [self.blockO addExecutionBlock:^{
                NSLog(@"NSBlockOperation--2");
            }];
            NSLog(@"NSBlockOperation--run");
//            [self.blockO main];
            [self.blockO start];
        }
            break;
        case 2:{ //先后顺序试验
            self.invocationO = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(handleInvocation:) object:nil];
            self.invocationO.queuePriority = NSOperationQueuePriorityLow;
            self.blockO = [NSBlockOperation blockOperationWithBlock:^{
                NSLog(@"NSBlockOperation--1-%@",[NSThread currentThread]);
            }];
            [self.blockO addDependency:self.invocationO];
            self.blockO.queuePriority = NSOperationQueuePriorityHigh;

            if ([self.blockO isReady]) {
                [self.blockO start];
            }
            self.invocationO.qualityOfService = NSQualityOfServiceBackground;
            [self.invocationO start];
            [self.blockO start];
        }
            break;
            case 3:{ //先后顺序试验
                    //创建操作队列
                NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
                //创建最后一个操作
                NSBlockOperation *lastBlockOperation=[NSBlockOperation blockOperationWithBlock:^{
                    sleep(1);
                    NSLog(@"最后的任务");
                }];
                for (int i=0; i<5-1; ++i) {
                    //创建多线程操作
                    NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
                        sleep(i);
                        NSLog(@"第%d个任务 - %@",i,[NSThread currentThread]);
                    }];
                    //设置依赖操作为最后一个操作
                    [blockOperation addDependency:lastBlockOperation];
                    [operationQueue addOperation:blockOperation];
                    
                }
                //将最后一个操作加入线程队列
                [operationQueue addOperation:lastBlockOperation];
            }
            break;
        default:
            break;
    }
}

- (void)handleInvocation:(NSInvocationOperation *)sender {
    NSLog(@"NSInvocationOperation--1-%@",[NSThread currentThread]);
}

- (UIButton *)createBtn:(NSString *)title tag:(int)tag {
    UIButton *btn = [UIButton buttonWith:title tColor:nil cImage:nil target:self selector:@selector(handleBtnClick:)];
    [btn sizeToFit];
    btn.tag = tag;
    NSLogSize(btn.size);
    return btn;
}


@end
