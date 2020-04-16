//
//  MMFuncTestListVC.h
//  LogDemo
//
//  Created by mumu on 2020/4/1.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMBaseTableViewController.h"

@protocol Common <NSObject>

@property (nonatomic, strong) NSString *flag;


@end

NS_ASSUME_NONNULL_BEGIN

@interface MMFuncTestListVC : MMBaseTableViewController <Common>

@end

NS_ASSUME_NONNULL_END
