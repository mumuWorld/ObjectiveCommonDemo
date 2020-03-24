//
//  MMCollectionReusableView.m
//  LogDemo
//
//  Created by mumu on 2020/1/19.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCollectionReusableView.h"

@implementation MMCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        [self addSubview:self.contentLabel];
    }
    return self;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"我是区头";
        _contentLabel = label;
//        _label.font = [UIFont systemFontOfSize:25];
    }
    return _contentLabel;
}
@end
