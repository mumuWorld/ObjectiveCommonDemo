//
//  MMIndistinctView.m
//  LogDemo
//
//  Created by mumu on 2020/1/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMIndistinctView.h"
#import "MMIndistinctTools.h"

@interface MMIndistinctView ()

@property (nonatomic, strong) UIImageView *originalImage;

@property (nonatomic, strong) UIImageView *indistinctImage;

@property (nonatomic, strong) UISlider *sliderView;

@property (nonatomic, strong) UILabel *valueLabel;
@end

@implementation MMIndistinctView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor mm_randomColor];
        [self addSubview:self.originalImage];
        [self addSubview:self.indistinctImage];
        [self addSubview:self.sliderView];
        [self addSubview:self.valueLabel];
//        [self sliderValueChange:self.sliderView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat fitW = ceil(self.width * 0.5);
    self.originalImage.frame = CGRectMake(0, 0, fitW, self.height - 40);
    self.indistinctImage.frame = CGRectMake(fitW, 0, fitW, self.height - 40);
    self.sliderView.width = self.width - 100;
    self.sliderView.center = CGPointMake(fitW, self.height - 10);
    self.valueLabel.center = CGPointMake(fitW, self.height - 30);
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    if (self.superview) {
        [self sliderValueChange:self.sliderView];
    }
}

#pragma mark - public
- (void)setStyle:(int)style {
    _style = style;
    if (style == 0) {
        self.sliderView.maximumValue = 30;
    } else if (style == 1) {
        self.sliderView.maximumValue = 1;
    } else if (style == 2) {
        self.sliderView.maximumValue = 30;
    }
}

#pragma mark - target
- (void)sliderValueChange:(UISlider *)sender {
    self.valueLabel.text = [NSString stringWithFormat:@"%f",sender.value];
    [self.valueLabel sizeToFit];
    
    [MMIndistinctTools createIndistinctImage:sender.value size:self.indistinctImage.frame.size style:self.style finish:^(UIImage * _Nonnull image) {
        NSLog(@"style -> %d, image -> %@",self.style,image);
        if (image) {
//            [self.indistinctImage setImage:image fitSize:CGSizeZero];
            self.indistinctImage.image = image;
        }
    }];
}

#pragma mark - getter && setter
- (UIImageView *)originalImage {
    if (!_originalImage) {
        UIImageView *original = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
        original.contentMode = UIViewContentModeScaleAspectFill;
        original.layer.masksToBounds = true;
        _originalImage = original;
    }
    return _originalImage;
}

- (UIImageView *)indistinctImage {
    if (!_indistinctImage) {
        UIImageView *original = [[UIImageView alloc] init];
        original.contentMode = UIViewContentModeScaleAspectFill;
        original.layer.cornerRadius = 4;
        original.layer.masksToBounds = true;
        _indistinctImage = original;
    }
    return _indistinctImage;
}

- (UISlider *)sliderView {
    if (!_sliderView) {
        UISlider *slider = [[UISlider alloc] init];
        slider.minimumValue = 0;
        slider.maximumValue = 30;
        slider.value = 0;
        slider.continuous = false;
        [slider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
        _sliderView = slider;
    }
    return _sliderView;
}

- (UILabel *)valueLabel {
    if (!_valueLabel) {
        UILabel *label = [[UILabel alloc] init];
        _valueLabel = label;
    }
    return _valueLabel;
}
@end
