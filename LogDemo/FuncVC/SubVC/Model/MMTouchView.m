//
//  MMTouchView.m
//  LogDemo
//
//  Created by mumu on 2020/4/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMTouchView.h"

@implementation MMTouchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
            frame.size = CGSizeMake(100, 100);
        }
    self = [super initWithFrame:frame];
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"tag=%zd",self.tag);

//    if (self.tag != 20) {
//        return [super hitTest:point withEvent:event];
//    }
//    NSLog(@"tag=%zd",self.tag);
//    UIView *tag21View = [self viewWithTag:21];
//    if ([tag21View pointInside:point withEvent:event]) {
//        return tag21View;
//    }
    return [super hitTest:point withEvent:event];
}

@end
