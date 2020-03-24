//
//  MMCollectionLayoutVC.m
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCollectionLayoutVC.h"
#import "MMHomeListTableViewCell.h"
#import "MMHomeListModel.h"

@implementation MMCollectionLayoutVC
@synthesize listArray = _listArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"CollectionViewDemo";
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
    UIViewController *target = [[class alloc] init];
    target.navigationItem.title = model.name;
    [self.navigationController pushViewController:target animated:true];
}

#pragma mark - getter && setter

- (NSArray *)listArray {
    if (!_listArray) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"collection_layout_list" ofType:@"plist"];
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
