//
//  MMScreenRotateVC.m
//  LogDemo
//
//  Created by mumu on 2020/1/21.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMScreenRotateVC.h"

@interface MMScreenRotateVC ()

@property (nonatomic, strong) UIView *tmpView;

@property (nonatomic, strong) UIButton *tmpBtn;
@end

@implementation MMScreenRotateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tmpView.frame = CGRectMake(0, 100, ScreenWidth, 300);
    self.tmpBtn.center = CGPointMake(ScreenWidth * 0.5, 150);
    [self.view addSubview:self.tmpView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDeviceOrientationDidChange)
                         name:UIDeviceOrientationDidChangeNotification
                                                   object:nil];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

- (void)changeRotation:(UIButton *)sender {
    if (sender.isSelected) {
        //设置竖屏
//        NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
//                [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
//
                NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
                [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    } else {
        //设置横屏
//        NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
//                [[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
                
                NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
                [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }
    sender.selected = !sender.isSelected;
    
}

 - (BOOL)onDeviceOrientationDidChange{
    //获取当前设备Device
    UIDevice *device = [UIDevice currentDevice] ;
    //识别当前设备的旋转方向
    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕幕朝上平躺");
            break;

        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            break;

        case UIDeviceOrientationUnknown:
            //系统当前无法识别设备朝向，可能是倾斜
            NSLog(@"未知方向");
            break;

        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左橫置");
            break;

        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            break;

        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            break;

        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            break;

        default:
            NSLog(@"无法识别");
            break;
    }
    return YES;
}

- (BOOL)prefersStatusBarHidden {
    return false;
}

#pragma mark - getter && setter
- (UIView *)tmpView {
    if (!_tmpView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = UIColor.cyanColor;
        UIButton *btn = [[UIButton alloc] init];
        [btn addTarget:self action:@selector(changeRotation:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"标题标题" forState:UIControlStateNormal];
        [btn sizeToFit];
        [view addSubview:btn];
        _tmpView = view;
        _tmpBtn = btn;
    }
    return _tmpView;
}

@end
