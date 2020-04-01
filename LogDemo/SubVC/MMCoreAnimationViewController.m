//
//  MMCoreAnimationViewController.m
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCoreAnimationViewController.h"
#import "MMHomeListTableViewCell.h"
#import "MMHomeListModel.h"

@interface MMCoreAnimationViewController ()

@end

@implementation MMCoreAnimationViewController
@synthesize listArray = _listArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)initSubView {
    [self.tableView registerNib:[UINib nibWithNibName:@"MMHomeListTableViewCell" bundle:nil] forCellReuseIdentifier:@"MMHomeListTableViewCell"];
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets =  false;
        }
    //这是滚动条
    if (@available(iOS 13.0, *)) {
        self.tableView.automaticallyAdjustsScrollIndicatorInsets = false;
    }
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
        NSString * path = [[NSBundle mainBundle] pathForResource:@"core_animation_list" ofType:@"plist"];
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
