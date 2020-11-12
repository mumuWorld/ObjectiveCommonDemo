//
//  MMCustomTableviewVC.m
//  LogDemo
//
//  Created by World on 2020/6/11.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCustomTableviewVC.h"
#import "MMCustomButton.h"
#import "MMCustomScrollView.h"

@interface MMCustomTableviewVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) MMCustomScrollView *scrollView;
@end

@implementation MMCustomTableviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *header = [[UIView alloc] init];
    header.size = CGSizeMake(ScreenWidth - 200, 50);
    header.backgroundColor = UIColor.greenColor;
    
    UIView *footer = [[UIView alloc] init];
    footer.size = CGSizeMake(ScreenWidth - 100, 50);
    footer.backgroundColor = UIColor.blueColor;
    
//    self.tableView.tableHeaderView = header;
//    self.tableView.tableFooterView = footer;
    
    self.tableView.estimatedRowHeight = 10;
    
    self.tableView.frame = CGRectMake(50, 100, ScreenWidth - 100, 400.5);
    [self.view addSubview:self.tableView];

    NSString * _imageWidth = @"0";
    CGFloat width = ([_imageWidth floatValue] ? [_imageWidth floatValue] / 3.0 : 58);
    NSLog(@"");
//    [self.tableView reloadData];
    
//    [self.view addSubview:self.scrollView];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        MMCustomButton *maskView = [MMCustomButton new];
//        maskView.frame = CGRectMake(0, 100, ScreenWidth, 20);
//        maskView.backgroundColor = UIColor.greenColor;
////        [self.tableView addSubview:maskView];
//        [self.scrollView addSubview:maskView];
//    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tableView reloadData];
    NSArray *arr = [self.tableView visibleCells];
    NSLog(@"重载");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"joeLog->1");
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"joeLog->2=%zd",section);
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"joeLog->4=%@",indexPath);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DefaultEmptyCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd-%zd",indexPath.section,indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"joeLog->5=%@",indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"joeLog->3=%@",indexPath);
    return 200;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSLog(@"joeLog->7=%zd",section);
    UIView *header = [UIView new];
    header.backgroundColor = UIColor.cyanColor;
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"joeLog->6=%zd",section);
    return 20;
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    NSLog(@"joeLog->8=%zd",section);
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"joeLog->9=%@",indexPath);
    return 40;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@",[NSValue valueWithCGPoint:scrollView.contentOffset]);
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
//            UIView *empty = [UIView new];
//            listView.tableFooterView = empty;
            listView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
            _tableView = listView;
        } else {
            
        }
    }
    return _tableView;
}

- (MMCustomScrollView *)scrollView {
    if (!_scrollView) {
        MMCustomScrollView *scroll = [MMCustomScrollView new];
        scroll.backgroundColor = UIColor.lightGrayColor;
        scroll.contentSize = CGSizeMake(ScreenWidth - 100, 600);
        scroll.frame = CGRectMake(50, 550, ScreenWidth - 100, 200);
        _scrollView = scroll;
    }
    return _scrollView;
}
@end
