//
//  MMTouchControl.m
//  LogDemo
//
//  Created by mumu on 2021/2/8.
//  Copyright © 2021 mumu. All rights reserved.
//

#import "MMTouchControl.h"

@implementation MMTouchControl

- (void)handleGesture:(UIGestureRecognizer *)sender {
    NSLog(@"view.tag=%zd, state=%zd",sender.view.tag, sender.state);
}

- (void)p_handleBtnClick:(UIControl *)sender {
    NSLog(@"view.tag=%zd",sender.tag);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"event.type=%zd",event.type);
}
@end
