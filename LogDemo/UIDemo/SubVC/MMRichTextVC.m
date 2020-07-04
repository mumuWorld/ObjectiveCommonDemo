//
//  MMRichTextVC.m
//  LogDemo
//
//  Created by mumu on 2020/3/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMRichTextVC.h"
#import <Masonry.h>

@interface MMRichTextVC ()<UITextFieldDelegate>
@property (nonatomic, strong) UILabel *richTextLabel;

@property (nonatomic, strong) UIImageView *testImage;

@property (nonatomic, strong) UITextField *inputField;

@end

@implementation MMRichTextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.richTextLabel];
    self.richTextLabel.frame = CGRectMake(10, NavigationBarHeight, 300, 300);
    
    NSTextAttachment *imageAttach = [[NSTextAttachment alloc] init];
    UIImage *img = [UIImage imageNamed:@"email_bg"];
    NSLog(@"imgSize=%@",[NSValue valueWithCGSize:img.size]);
    imageAttach.image = img;
    imageAttach.bounds = CGRectMake(0, 0, img.size.width, img.size.height);
    NSMutableAttributedString *mutAttr = [[NSMutableAttributedString alloc] init];
    
    NSAttributedString *imageAtt = [NSAttributedString attributedStringWithAttachment:imageAttach];

    NSAttributedString *strAttr = [[NSAttributedString alloc] initWithString:@"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],NSForegroundColorAttributeName: UIColor.redColor}];
    
    [mutAttr appendAttributedString:imageAtt];
    [mutAttr appendAttributedString:strAttr];
    
    self.richTextLabel.attributedText = mutAttr;
    CGSize fitSize = [mutAttr boundingRectWithSize:CGSizeMake(300, 0) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    self.richTextLabel.height = fitSize.height;
    
    //图片确实是原尺寸 除以 *2 *3 后的。
    UIImage *img2 = [UIImage imageNamed:@"hotel_logo_booking"];
    NSLog(@"img2-%@",[NSValue valueWithCGSize:img2.size]);
    self.testImage.frame = CGRectMake(50, 300, img2.size.width, img2.size.height);
    [self.view addSubview:self.testImage];
    
    NSLog(@"fff=%f",BottomSafeAreaHeight);
    [self.view addSubview:self.inputField];
    [self.inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(600);
        make.left.mas_equalTo(self.view).offset(10);
        make.right.mas_equalTo(self.view).offset(-10);
        make.height.mas_equalTo(30);
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testParamFunc:self.inputField.text ? [self.inputField.text floatValue] : 17];
}
- (void)testParamFunc:(CGFloat)fontSize {
    UIFont *font = [UILabel new].font;
    CGFloat systemSize = [UIFont systemFontSize];
    
    NSLog(@"%f---sys:%f",font.pointSize,systemSize);
//    UIFont *comFont = [UIFont systemFontOfSize:systemSize];
    UIFont * comFont = [UIFont systemFontOfSize:fontSize weight:UIFontWeightMedium];
    NSLog(@"familyName-%@",comFont.familyName);
    NSLog(@"fontName-%@",comFont.fontName);
    //字体大小数值
    NSLog(@"pointSize-%f",comFont.pointSize);
    //基准线到顶部
    NSLog(@"ascender-%f",comFont.ascender);
    //基准线到底部  负数
    NSLog(@"descender-%f",comFont.descender);
    //大写字符
    NSLog(@"capHeight-%f",comFont.capHeight);
    //x 字母
    NSLog(@"xHeight-%f",comFont.xHeight);
    NSLog(@"lineHeight-%f",comFont.lineHeight);
    //行之间的高度  leading指的是如果有多行的话，两个baseline之间的距离，如果只有一行，那么这个值就是0.

    NSLog(@"leading-%f",comFont.leading);
}

- (UILabel *)richTextLabel {
    if (!_richTextLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:20];
        label.numberOfLines = 0;
        _richTextLabel = label;
    }
    return _richTextLabel;
}
- (UIImageView *)testImage {
    if (!_testImage) {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hotel_logo_booking"]];
        _testImage = img;
    }
    return _testImage;
}
- (UITextField *)inputField {
    if (!_inputField) {
        UITextField *field = [[UITextField alloc] init];
        field.backgroundColor = UIColor.cyanColor;
        field.placeholder = @"保持";
        field.delegate = self;
        _inputField = field;
    }
    return _inputField;
}
@end
