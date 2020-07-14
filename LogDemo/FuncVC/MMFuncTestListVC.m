//
//  MMFuncTestListVC.m
//  LogDemo
//
//  Created by mumu on 2020/4/1.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMFuncTestListVC.h"
#import "MMHomeListTableViewCell.h"
#import "MMHomeListModel.h"
#import "MMSimpleFuncTestTool.h"

@interface MMFuncTestListVC ()

@end

@implementation MMFuncTestListVC
@synthesize listArray = _listArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [MMSimpleFuncTestTool printTable];
}
- (void)initSubView {
     [self.tableView registerNib:[UINib nibWithNibName:@"MMHomeListTableViewCell" bundle:nil] forCellReuseIdentifier:@"MMHomeListTableViewCell"]; 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MMHomeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MMHomeListTableViewCell" forIndexPath:indexPath];
    [cell loadModel:self.listArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    MMHomeListModel *model = self.listArray[indexPath.row];
    if (!model.router) {
        return;
    }
    Class class = NSClassFromString(model.router);
    id target = [[class alloc] init];
    [self.navigationController pushViewController:target animated:true];
}

#pragma mark - getter && setter
- (NSArray *)listArray {
    if (!_listArray) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"func_list" ofType:@"plist"];
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
