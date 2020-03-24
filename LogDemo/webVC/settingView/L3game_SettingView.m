//
//  SettingView.m
//  L3Game
//
//  Created by YangJie on 2017/10/20.
//  Copyright © 2017年 StarMahjong. All rights reserved.
//

#import "L3game_SettingView.h"

@interface L3game_SettingView()
@property (weak, nonatomic) IBOutlet UIView *BGview;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UIButton *fontSettingBtn;
@property (weak, nonatomic) IBOutlet UILabel *fontLabel;
@end

@implementation L3game_SettingView

+ (instancetype)L3gamef_settingView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.fontSettingBtn.hidden = YES;
    self.fontLabel.hidden = YES;
    [self setViewAndAnimation];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setViewAndAnimation];
//    NSLog(@"%s",__func__);
}
-(void)layoutIfNeeded
{
//    NSLog(@"%s",__func__);
}
#pragma mark --------- Btn Click EVENT
- (IBAction)settingFontClick:(id)sender {
}
- (IBAction)refreshBtnClick:(id)sender {
    if (self.refreshBLK) {
        self.refreshBLK();
    }
    [self L3gamef_removeAnimation];
}
- (IBAction)cancelBtnClick:(id)sender {
    [self L3gamef_removeAnimation];
    if (self.dismissBLK) {
        self.dismissBLK();
    }
}
- (void)L3gamef_removeAnimation
{
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomView.transform = CGAffineTransformMakeTranslation(0.01, self.bottomView.frame.size.height);
        self.bottomView.alpha = 0.2;
        self.BGview.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
- (void)setViewAndAnimation
{
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelBtnClick:)];
    gesture.numberOfTapsRequired = 1;
    gesture.cancelsTouchesInView = NO;
    [_BGview addGestureRecognizer:gesture];
    self.BGview.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2f];
    self.BGview.opaque = NO;
    self.bottomView.transform = CGAffineTransformMakeTranslation(0.01, self.bottomView.frame.size.height);
//    NSLog(@"bbgView=%@",_BGview);
    [UIView animateWithDuration:0.3 animations:^{
        _BGview.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:1.f];
    }];
    [UIView animateWithDuration:0.3 animations:^{
//        _BGview.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
        _bottomView.transform = CGAffineTransformMakeTranslation(0.01f, 0.01f);
    }];
}
@end
