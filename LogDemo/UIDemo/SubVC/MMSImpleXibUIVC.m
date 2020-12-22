//
//  MMSImpleXibUIVC.m
//  LogDemo
//
//  Created by mumu on 2020/5/6.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSImpleXibUIVC.h"
#import "UIView+MMCategory.h"

@interface MMSImpleXibUIVC ()
@property (weak, nonatomic) IBOutlet UILabel *attributeLabel;
@property (weak, nonatomic) IBOutlet UIView *grayView;
@property (weak, nonatomic) IBOutlet UIView *purView;

@property (weak, nonatomic) IBOutlet UIView *grayView_2;
@property (weak, nonatomic) IBOutlet UIImageView *grayViewSubImg;
@property (weak, nonatomic) IBOutlet UIButton *testBtn;
@property (weak, nonatomic) IBOutlet UIView *superAlphaView;

@end

@implementation MMSImpleXibUIVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _superAlphaView.alpha = 0;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTag:)];
    [_superAlphaView addGestureRecognizer:tap];
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:@"AQCaqf123一二三测试文字￥2330/张"];
    UIFont *font_1 = [UIFont systemFontOfSize:25 weight:UIFontWeightMedium];
    UIFont *font_2 = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    _testBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    _testBtn.currentBackgroundImage
    [attribute addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17],
                               NSForegroundColorAttributeName: [UIColor redColor]
    }
                       range:NSMakeRange(0, 3)];
    [attribute addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:25 weight:UIFontWeightBold],
                               NSForegroundColorAttributeName: [UIColor grayColor]}
                       range:NSMakeRange(3, 3)];
    [attribute addAttributes:@{
        NSFontAttributeName: [UIFont systemFontOfSize:17 weight:UIFontWeightRegular],
        NSForegroundColorAttributeName: [UIColor greenColor],
        NSBackgroundColorAttributeName: [UIColor purpleColor]
    }
    range:NSMakeRange(6, 3)];
    [attribute addAttributes:@{
        NSFontAttributeName: font_1,
        NSForegroundColorAttributeName: [UIColor blueColor],
        NSUnderlineColorAttributeName: [UIColor lightGrayColor],
        NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)
    }
    range:NSMakeRange(9, 3)];
    [attribute addAttributes:@{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:24],
        NSForegroundColorAttributeName: [UIColor redColor],
    }
    range:NSMakeRange(16, 5)];
    [attribute addAttributes:@{
        NSFontAttributeName: [UIFont boldSystemFontOfSize:12],
        NSForegroundColorAttributeName: [UIColor grayColor],
    }
    range:NSMakeRange(21, 2)];
    CGFloat offset = (font_1.lineHeight - font_2.lineHeight)/2 + ((font_1.descender - font_2.descender));
    NSLog(@"offset=%f",offset);
    //正号 向上偏移
    [attribute addAttributes:@{
        NSFontAttributeName: font_2,
        NSBaselineOffsetAttributeName:@(offset),
    } range:NSMakeRange(12, 4)];
    
    _attributeLabel.attributedText = attribute;
    //AF52DE
//    [_grayView setColors:@[[UIColor mm_colorWithHex:0xf8f8f8],[UIColor mm_colorWithHex:0xf8f8f8],[UIColor mm_colorWithHex:0xffffff]] locations:@[@(0.3),@(0.6),@(1.0)] withDirectionType:kGradientColorDirectionTypeHorizontal];
//     [_purView setColors:@[[UIColor mm_colorWithHex:0xAF52DE],[UIColor mm_colorWithHex:0xAF52DE],[UIColor mm_colorWithHex:0xffffff]] locations:@[@(0.3),@(0.6),@(1.0)] withDirectionType:kGradientColorDirectionTypeHorizontal];
    [_grayView setColors:@[[UIColor mm_colorWithHex:0xf8f8f8],[UIColor mm_colorWithHex:0xffffff]] locations:@[@(0.6),@(1.0)] withDirectionType:kGradientColorDirectionTypeHorizontal];
    [_purView setColors:@[[UIColor mm_colorWithHex:0xAF52DE],[UIColor mm_colorWithHex:0xffffff]] locations:@[@(0.6),@(1.0)] withDirectionType:kGradientColorDirectionTypeHorizontal];
    
    CGPathRef path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 30) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(30, 30)].CGPath;
    
    UIBezierPath *specialPath = [UIBezierPath bezierPath];
//    [specialPath addArcWithCenter:CGPointMake(15, 15) radius:15 startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:true];

    [specialPath moveToPoint:CGPointMake(100, 0)];
    [specialPath addLineToPoint:CGPointMake(15, 0)];
//    [specialPath stroke];
//    [specialPath removeAllPoints];
    [specialPath addArcWithCenter:CGPointMake(15, 15) radius:15 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:false];
    specialPath.lineJoinStyle = kCGLineJoinRound;
//    [specialPath moveToPoint:CGPointMake(15, 30)];
//    [specialPath addQuadCurveToPoint:CGPointMake(30, 30) controlPoint:CGPointMake(15, 30)];
    [specialPath addLineToPoint:CGPointMake(100, 30)];
    
    CAShapeLayer *shaper = [CAShapeLayer layer];
    shaper.path = path;
    shaper.frame = CGRectMake(0, 0, 100, 30);
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, 100, 30);
//    borderLayer.borderColor = UIColor.redColor.CGColor;
//    borderLayer.borderWidth = 2;
    borderLayer.path = specialPath.CGPath;
    borderLayer.fillColor = UIColor.clearColor.CGColor;
    borderLayer.strokeColor = UIColor.greenColor.CGColor;
    borderLayer.lineWidth = 3;
    
//    [shaper addSublayer:borderLayer];
    
    [_grayViewSubImg.layer addSublayer:borderLayer];
//    _grayViewSubImg.layer.mask = shaper;
    _grayViewSubImg.layer.mask = shaper;
}


- (void)handleTag:(UITapGestureRecognizer *)tap {
    NSLog(@"superAlphaView");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
