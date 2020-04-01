//
//  MMHomeListViewController.m
//  LogDemo
//
//  Created by mumu on 2019/12/18.
//  Copyright © 2019 feiyujie. All rights reserved.
//

#import "MMHomeListViewController.h"
#import "MMHomeListTableViewCell.h"
#import "MMHomeListModel.h"
#import "MMMasonryViewController.h"
#import "MMLayerTestViewController.h"
#import "MMCrashTestViewController.h"
#import "L3game_WebViewController.h"
#import "NavViewController.h"
@interface MMHomeListViewController ()<UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching>
@property (weak, nonatomic) IBOutlet UITableView *listView;

@property (nonatomic, copy) NSArray *listArray;

@property (nonatomic, strong) UIView *someView;
@property (nonatomic, strong) UIView *view1;
@property (nonatomic, strong) UIView *view2;
@end

@implementation MMHomeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.listView registerClass:[MMHomeListTableViewCell class] forCellReuseIdentifier:@"MMHomeListTableViewCell"];
    [self.listView registerNib:[UINib nibWithNibName:@"MMHomeListTableViewCell" bundle:nil] forCellReuseIdentifier:@"MMHomeListTableViewCell"];
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    window.backgroundColor = UIColor.redColor;
//    self.someView = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
//    self.someView.backgroundColor = [UIColor greenColor];
//    self.listView.tableHeaderView = self.someView;
//    [self.view addSubview:self.someView];
//
//    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    self.view1.backgroundColor = [UIColor redColor];
//    self.view1.alpha = 0;
//    [self.someView addSubview:self.view1];
//
//    self.view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
//    self.view2.backgroundColor = [UIColor blueColor];
//    [self.someView addSubview:self.view2];
    
    NSLog(@"tmp=%ld", nil < 1);
    
    
    NSString *max = @"\nabc\n";
    NSString *min = [self getFitContentStr:max];
    NSLog(@"--%@",min);
}

- (void)initSubView {
    self.navigationItem.title = @"主列表";
}

- (NSString *)getFitContentStr:(NSString *)text {
    if ([text hasPrefix:@"\n"]) {
        text = [text substringFromIndex:1];
    }
    if ([text hasSuffix:@"\n"]) {
        text = [text substringToIndex:text.length -1];
    }
    return text;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.view2.alpha = 1;
//    self.someView.center = CGPointMake(100, 200);
//    self.view1.alpha = 0;
//    [UIView transitionWithView:self.someView duration:2.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
//         self.view2.alpha = 0;
//         self.someView.center = CGPointMake(200, 400);
//         self.view1.alpha = 1;
//     } completion:^(BOOL finished) {
//     }];
}

#pragma mark --代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
    MMHomeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMHomeListTableViewCell" forIndexPath:indexPath];
    [cell loadModel:self.listArray[indexPath.row % 10]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath");
    return 100;
}

- (void)tableView:(nonnull UITableView *)tableView prefetchRowsAtIndexPaths:(nonnull NSArray<NSIndexPath *> *)indexPaths {
    NSLog(@"prefetchRows->%@",indexPaths);
}

- (void)tableView:(UITableView *)tableView cancelPrefetchingForRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths {
    NSLog(@"cancelPrefetch->%@",indexPaths);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MMHomeListModel *model = self.listArray[indexPath.row % 10];
    if (indexPath.row == 0) {
//        L3game_WebViewController *webView = [[L3game_WebViewController alloc] initWithDict:@{@"url":@"https://www.baidu.com/"}];
//        NavViewController *navi = [[NavViewController alloc] initWithRootViewController:webView];
//        navi.modalPresentationStyle = UIModalPresentationFullScreen;
//        [self.navigationController presentViewController:navi animated:true completion:nil];
        
        MMMasonryViewController *vc = [[MMMasonryViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    } else if (indexPath.row == 1) {
        MMLayerTestViewController *vc = [[MMLayerTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    } else if (indexPath.row == 2) {
        MMCrashTestViewController *vc = [[MMCrashTestViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    } else if (model.router.length > 0) {
        Class class = NSClassFromString(model.router);
        id target = [[class alloc] init];
        [self.navigationController pushViewController:target animated:true];
    }
    
}

#pragma mark --get & set
- (NSArray *)listArray {
    if (!_listArray) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"home_list" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tmpArr = [[NSMutableArray alloc] initWithCapacity:arr.count];
        for (NSDictionary * tmp in arr) {
            MMHomeListModel *model = [MMHomeListModel initWithDict:tmp];
            [tmpArr addObject:model];
        }
        _listArray = [tmpArr copy];
    }
    return _listArray;
}
@end
