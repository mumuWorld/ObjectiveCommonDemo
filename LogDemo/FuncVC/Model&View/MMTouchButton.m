//
//  MMTouchButton.m
//  LogDemo
//
//  Created by mumu on 2021/2/8.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMTouchButton.h"

@implementation MMTouchButton

- (void)handleGesture:(UIGestureRecognizer *)sender {
    NSLog(@"view.tag=%zd, state=%zd",sender.view.tag, sender.state);
}

- (void)p_handleBtnClick:(UIButton *)sender {
    NSLog(@"view.tag=%zd",sender.tag);
}

@end
