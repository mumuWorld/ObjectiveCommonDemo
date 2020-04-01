//
//  MMAnimationViewController.m
//  LogDemo
//
//  Created by mumu on 2020/1/9.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMAnimationViewController.h"
#import "MMHomeListTableViewCell.h"
#import "MMHomeListModel.h"

@interface MMAnimationViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate>

@property (nonatomic, strong) UITableView *listView;

@property (nonatomic, copy) NSArray *listArray;

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, strong) UIView *searchView;
@end

@implementation MMAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"动画展示";
    self.listView.frame = self.view.bounds;
    [self.view addSubview:self.listView];
    UIButton *btn = [UIButton buttonWith:@"动画" tColor:nil cImage:nil target:self selector:@selector(handleBtnClick:)];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithBtn:btn];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    [item setTitle:@""];
    [item setImage:nil];
    self.navigationItem.backBarButtonItem = item;
    
    
    if (@available(iOS 11.0, *)) {
        CGRect frame = self.searchController.searchBar.frame;
        self.searchController.searchBar.frame = frame;
        self.listView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        self.navigationItem.searchController = self.searchController;
        self.navigationItem.hidesSearchBarWhenScrolling = NO;
//        self.listView.tableHeaderView = self.searchController.searchBar;
    } else {
        self.automaticallyAdjustsScrollViewInsets =  false;
    }
    self.listView.contentInset = UIEdgeInsetsMake(NavigationBarHeight, 0, 0, 0);
    
    UIView *test = [[UIView alloc] initWithFrame:CGRectMake(300, 100, 300, 200)];
    self.searchView = test;
    [self.view addSubview:self.searchView];
    self.searchView = self.searchController.searchBar;
    
    //    [self.view addSubview:self.searchController.searchBar];
}

- (void)handleBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
    MMHomeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMHomeListTableViewCell" forIndexPath:indexPath];
    [cell loadModel:self.listArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"heightForRowAtIndexPath");
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MMHomeListModel *model = self.listArray[indexPath.row];
    if (!model.router) {
        return;
    }
    Class class = NSClassFromString(model.router);
    id target = [[class alloc] init];
    [self.navigationController pushViewController:target animated:true];
}

#pragma mark - UISearchControllerDelegate

-(void)presentSearchController:(UISearchController *)searchController {
    NSLog(@"%@--",searchController);
}

#pragma mark - getter && setter
- (NSArray *)listArray {
    if (!_listArray) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"animation_list" ofType:@"plist"];
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

- (UITableView *)listView {
    if (!_listView) {
        UITableView *listView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [listView registerNib:[UINib nibWithNibName:@"MMHomeListTableViewCell" bundle:nil] forCellReuseIdentifier:@"MMHomeListTableViewCell"];        listView.delegate = self;
        listView.dataSource = self;
        _listView = listView;
    }
    return _listView;
}

- (UISearchController *)searchController {
    if (!_searchController) {
        UISearchController *searchController = [[UISearchController alloc] init];
        searchController.delegate = self;
        searchController.searchBar.placeholder = @"搜索站位";
//        searchController.searchResultsController = self;
        _searchController = searchController;
    }
    return _searchController;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //判断为右滑手势
    if ([gestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
//        [self slideBack];
        NSLog(@"返回");
        return YES;
    }
    
    return YES;
}
@end
