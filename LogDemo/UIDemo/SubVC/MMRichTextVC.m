//
//  MMRichTextVC.m
//  LogDemo
//
//  Created by mumu on 2020/3/16.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMRichTextVC.h"

@interface MMRichTextVC ()
@property (nonatomic, strong) UILabel *richTextLabel;
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

@end
