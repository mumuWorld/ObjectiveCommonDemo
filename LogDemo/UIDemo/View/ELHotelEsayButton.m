//
//  ELHotelEsayButton.m
//  LogDemo
//
//  Created by mumu on 2020/8/18.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "ELHotelEsayButton.h"

@interface ELHotelEsayButton ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ELHotelEsayButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSuviews];
        [self setSuviewsLayout];
    }
    return self;
}

- (void)initSuviews {
    [self addSubview:self.titleLabel];
    [self addSubview:self.imageView];
}

- (void)setSuviewsLayout {
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
}



#pragma mark - getter && setter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 1;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.contentMode = UIViewContentModeScaleAspectFill;
        _imageView = imgV;
    }
    return _imageView;
}
@end
