//
//  MMBaseTableViewController.h
//  LogDemo
//
//  Created by mumu on 2020/1/15.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MMBaseTableViewController : MMBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *listArray;
@end

NS_ASSUME_NONNULL_END
