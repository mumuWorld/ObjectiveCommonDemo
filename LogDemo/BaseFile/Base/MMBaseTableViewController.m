//
//  MMBaseTableViewController.m
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMBaseTableViewController.h"

@interface MMBaseTableViewController ()

@end

@implementation MMBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets =  false;
    }
    if (self.navigationController) {
        self.tableView.contentInset = UIEdgeInsetsMake(NavigationBarHeight, 0, 0, 0);
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultEmptyCellReuseIdentifier forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

#pragma mark - getter && setter
- (NSArray *)listArray {
    if (!_listArray) {
        _listArray = [NSArray array];
    }
    return _listArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *listView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [listView registerClass:[UITableViewCell class] forCellReuseIdentifier: DefaultEmptyCellReuseIdentifier];
        listView.delegate = self;
        listView.dataSource = self;
        UIView *empty = [UIView new];
        listView.tableFooterView = empty;
        _tableView = listView;
    }
    return _tableView;
}

@end
