//
//  MMIndistinctViewController.m
//  LogDemo
//
//  Created by mumu on 2020/1/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMIndistinctViewController.h"
#import "MMIndistinctView.h"
#import "MMIndistinctTools.h"

@interface MMIndistinctViewController ()
@property (nonatomic, strong) UIScrollView *mainScrollView;

//@property (nonatomic, strong) MMIndistinctView *originalImage;

@property (nonatomic, strong) MMIndistinctView *coreImage;

@property (nonatomic, strong) MMIndistinctView *vImage;

@property (nonatomic, strong) MMIndistinctView *vImage_2;


@end

@implementation MMIndistinctViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mainScrollView];
//    [self.mainScrollView addSubview:self.originalImage];
    [self.mainScrollView addSubview:self.coreImage];
    [self.mainScrollView addSubview:self.vImage];
    [self.mainScrollView addSubview:self.vImage_2];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self caculateMissionCoastTime:@"CoreImage" task:^{
////            [self createIndistinctImageByCoreImage];
//    }];
//    [self caculateMissionCoastTime:@"vImage" task:^{
////            [self createIndistinctImageByVImage];
//    }];
//    [self caculateMissionCoastTime:@"vImage_2" task:^{
////            [self createImageByVImage2];
//    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.mainScrollView.frame = self.view.bounds;
    
//    self.originalImage.frame = CGRectMake(0, NavigationBarHeight, ScreenWidth, 200);
    self.coreImage.frame = CGRectMake(0, NavigationBarHeight, ScreenWidth, 240);
    self.vImage.frame = CGRectMake(0, self.coreImage.maxY + 20, ScreenWidth, 240);
    self.vImage_2.frame = CGRectMake(0, self.vImage.maxY + 20, ScreenWidth, 240);
}



- (void)caculateMissionCoastTime:(NSString *)taskName task:(void(^)(void))task {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CFTimeInterval start = CFAbsoluteTimeGetCurrent();
        task();
        CFTimeInterval end = CFAbsoluteTimeGetCurrent() - start;
           NSLog(@"%@->%f",taskName,end);
    });

}

#pragma mark - getter && setter
- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        UIScrollView *scroll = [[UIScrollView alloc] init];
        scroll.showsVerticalScrollIndicator = true;
        scroll.showsHorizontalScrollIndicator = false;
        if (@available(iOS 11.0, *)) {
            scroll.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        scroll.contentSize = CGSizeMake(ScreenWidth, 1200);
        _mainScrollView = scroll;
    }
    return _mainScrollView;
}

- (MMIndistinctView *)coreImage {
    if (!_coreImage) {
        MMIndistinctView *original = [[MMIndistinctView alloc] init];
        original.style = 0;
        _coreImage = original;
    }
    return _coreImage;
}

- (MMIndistinctView *)vImage {
    if (!_vImage) {
        MMIndistinctView *original = [[MMIndistinctView alloc] init];
        original.style = 1;
        _vImage = original;
    }
    return _vImage;
}

- (MMIndistinctView *)vImage_2 {
    if (!_vImage_2) {
        MMIndistinctView *original = [[MMIndistinctView alloc] init];
         original.style = 2;
        _vImage_2 = original;
    }
    return _vImage_2;
}

@end
