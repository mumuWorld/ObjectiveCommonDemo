//
//  MMLayerTestVC.m
//  LogDemo
//
//  Created by mumu on 2020/8/21.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMLayerTestVC.h"

@interface MMLayerTestVC ()
@property (weak, nonatomic) IBOutlet UIView *view_1;

@end

@implementation MMLayerTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect bounds = _view_1.bounds;
    CGSize size = _view_1.bounds.size;
    _view_1.layer.contentsScale = UIScreen.mainScreen.scale;
    CGFloat scale = _view_1.layer.contentsScale;
//    size.width *= UIScreen.mainScreen.scale;
//    size.height *= UIScreen.mainScreen.scale;

    UIColor *testColor = UIColor.redColor;
    NSLog(@"view_1=%@",[NSValue valueWithCGRect:_view_1.frame]);
    
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, testColor.CGColor);
    CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    _view_1.layer.contents = (__bridge id)image.CGImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
