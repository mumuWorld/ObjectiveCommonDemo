//
//  MMSingleLabelCVCell.m
//  LogDemo
//
//  Created by mumu on 2020/1/20.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMSingleLabelCVCell.h"

NSString *const MMSingleLabelCVCellIDStr = @"MMSingleLabelCVCell";

@interface MMSingleLabelCVCell ()

@property (weak, nonatomic) IBOutlet UILabel *singleLabel;

@end

@implementation MMSingleLabelCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.singleLabel.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.singleLabel.layer.borderWidth = 1;
}

#pragma mark - getter && setter
- (void)setContentText:(NSString *)contentText {
    self.singleLabel.text = contentText;
}
@end
