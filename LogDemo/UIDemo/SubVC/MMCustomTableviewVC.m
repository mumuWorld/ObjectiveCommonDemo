//
//  MMCustomTableviewVC.m
//  LogDemo
//
//  Created by World on 2020/6/11.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCustomTableviewVC.h"

@interface MMCustomTableviewVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *listArray;
@end

@implementation MMCustomTableviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultEmptyCellReuseIdentifier forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
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
        if (@available(iOS 13.0, *)) {
            UITableView *listView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleInsetGrouped];
            [listView registerClass:[UITableViewCell class] forCellReuseIdentifier: DefaultEmptyCellReuseIdentifier];
            listView.delegate = self;
            listView.dataSource = self;
            UIView *empty = [UIView new];
            listView.tableFooterView = empty;
            _tableView = listView;
        } else {
            
        }
    }
    return _tableView;
}

@end
