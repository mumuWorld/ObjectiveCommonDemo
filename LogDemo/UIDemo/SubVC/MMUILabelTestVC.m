//
//  MMUILabelTestVC.m
//  LogDemo
//
//  Created by mumu on 2020/6/13.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMUILabelTestVC.h"

@interface MMUILabelTestVC ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

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
