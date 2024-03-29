//
//  MMOperationViewController.m
//  LogDemo
//
//  Created by mumu on 2020/4/1.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMOperationViewController.h"
#import "MMSimpleFuncModel.h"

@interface MMOperationViewController ()
@property (nonatomic, strong) UIButton *blockOperation;
@property (nonatomic, strong) UIButton *priorityOperationBtn;
@property (nonatomic, strong) UIButton *queueBtn;
@property (nonatomic, strong) UIButton *mainQueueBtn;

@property (nonatomic, strong) NSBlockOperation *blockO;

@property (nonatomic, strong) NSInvocationOperation *invocationO;

@property (nonatomic, strong) NSObject *obj;

@property (nonatomic, strong) NSCache *cache;

@property (nonatomic, strong) MMSimpleFuncModel *funcModel;

@end

@implementation MMOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.obj = [NSObject new];
    self.cache = [[NSCache alloc] init];
    [self.cache setObject:self.obj forKey:@"test"];
    [self.cache setObject:self forKey:self.obj];

    id o_1 = [self.cache objectForKey:self.obj];
    self.obj = nil;
    id o_2 = [self.cache objectForKey:@"test"];
    NSLog(@"%@",o_2);
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
    
    self.mainQueueBtn = [self createBtn:@"queue测试" tag:4];
    self.mainQueueBtn.x = 10 + CGRectGetMaxX(self.queueBtn.frame);
    self.mainQueueBtn.y = NavigationBarHeight;
    [self.view addSubview:self.mainQueueBtn];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.obj = nil;
    NSLog(@"obj->%@",self.obj);
    NSLog(@"cache->%@",self.cache);
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
            
        case 4: {
            [self btn4Click];
            break;
        }
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


- (void)btn4Click {
//    NSLog(@"test->%@",self.funcModel.testKey);
    NSLog(@"test->%@",self.funcModel.onDebugInfo);
//    self.funcModel.onDebugInfo(@"test->str");
    NSLog(@"test->%@",self.funcModel.nullBlock);

    self.funcModel.nullBlock(@"test->");
//    self.funcModel.testKey = @"";
    //立即调用
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        self.funcModel.onDebugInfo(@"test->str");
//    }];
}

- (MMSimpleFuncModel *)funcModel {
    if (!_funcModel){
        _funcModel = [[MMSimpleFuncModel alloc] init];
//        _funcModel.onDebugInfo = ^(NSString * info){
//            NSLog(@"test->%@",info);
//        };
    }
    return _funcModel;
}
@end
