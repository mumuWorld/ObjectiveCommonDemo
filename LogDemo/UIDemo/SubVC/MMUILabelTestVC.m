//
//  MMUILabelTestVC.m
//  LogDemo
//
//  Created by mumu on 2020/6/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMUILabelTestVC.h"
#import "MMSimpleFuncModel.h"

@interface MMUILabelTestVC ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *attriLabel;

@property (nonatomic, strong)  MMSimpleFuncModel *funcModel;
@end

@implementation MMUILabelTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.titleLabel.width = 200;
    CGSize fitSize = [self.titleLabel intrinsicContentSize];
    
    CGSize fitSize_2 = [self.titleLabel.text boundingRectWithSize:CGSizeMake(200, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.titleLabel.font} context:nil].size;
    
    CGSize fitSize_3 = [self.titleLabel sizeThatFits:CGSizeMake(200, 0)];
    
    [self.titleLabel sizeToFit];
    CGSize fitSize_4 = self.titleLabel.size;
    _titleLabel.layer.cornerRadius = 10;
    _titleLabel.layer.masksToBounds = true;
    NSLog(@"size");
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:self.attriLabel.text];
    [attr addAttributes:@{
        NSBackgroundColorAttributeName: UIColor.greenColor,
        NSForegroundColorAttributeName: UIColor.blueColor
    } range:NSMakeRange(0, attr.length)];
    self.attriLabel.attributedText = attr;
    
    MMSimpleFuncModel *obj = [MMSimpleFuncModel new];
    __weak typeof(obj) wObj = obj;
    MMSimpleFuncModel *sObj = obj;
    NSLog(@"joeLog->ws=%@",wObj);
    obj = nil;
    NSLog(@"joeLog->ws=%@",wObj);
    
    self.funcModel = [MMSimpleFuncModel new];
    __weak typeof(_funcModel) wObj_2 = _funcModel;
    NSLog(@"joeLog->ws=%@",wObj_2);
    self.funcModel = nil;
    NSLog(@"joeLog->ws=%@",wObj_2);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.funcModel = [MMSimpleFuncModel new];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if ([self.funcModel respondsToSelector:@selector(postNotify)]) {
//            [self.funcModel postNotify];
//        }
//    });
//    self.funcModel = nil;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.funcModel respondsToSelector:@selector(postNotify)]) {
            [self.funcModel postNotify];
        }
    });
    [self.navigationController popViewControllerAnimated:true];
}

@end
