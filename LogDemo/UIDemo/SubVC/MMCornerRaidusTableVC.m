//
//  MMCornerRaidusTableVC.m
//  LogDemo
//
//  Created by mumu on 2020/11/11.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCornerRaidusTableVC.h"

@interface MMCornerRaidusTableVC ()

@end

@implementation MMCornerRaidusTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
