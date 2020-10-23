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
    self.tableView.frame = CGRectMake(50, 100, ScreenWidth - 100, 400);
    [self.view addSubview:self.tableView];
    
    UIView *header = [[UIView alloc] init];
    header.size = CGSizeMake(ScreenWidth - 200, 50);
    header.backgroundColor = UIColor.greenColor;
    
    UIView *footer = [[UIView alloc] init];
    footer.size = CGSizeMake(ScreenWidth - 100, 50);
    footer.backgroundColor = UIColor.blueColor;
    
    self.tableView.tableHeaderView = header;
    self.tableView.tableFooterView = footer;
    
    [self.tableView reloadData];
    dispatch_async(dispatch_get_main_queue(), ^{
        UIView *maskView = [UIView new];
        maskView.frame = CGRectMake(0, 400, ScreenWidth, 20);
        maskView.backgroundColor = UIColor.greenColor;
        [self.tableView addSubview:maskView];
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tableView reloadData];
    NSArray *arr = [self.tableView visibleCells];
    NSLog(@"重载");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultEmptyCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd-%zd",indexPath.section,indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@",[NSValue valueWithCGPoint:scrollView.contentOffset]);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"停止滚动");
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
            listView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
            _tableView = listView;
        } else {
            
        }
    }
    return _tableView;
}

@end
