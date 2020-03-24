//
//  MMHomeListTableViewCell.m
//  LogDemo
//
//  Created by mumu on 2019/12/18.
//  Copyright © 2019 feiyujie. All rights reserved.
//

#import "MMHomeListTableViewCell.h"
#import "MMHomeListModel.h"

@interface MMHomeListTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@property (weak, nonatomic) IBOutlet UILabel *botLabel;

@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;

@end

@implementation MMHomeListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadModel:(MMHomeBaseModel *)model {
    if (![model isMemberOfClass:[MMHomeListModel class]]) {
        return;
    }
    MMHomeListModel *realModel = (MMHomeListModel *)model;
    
    _topLabel.text = realModel.name;
    _botLabel.text = realModel.text ? : realModel.imageUrl;
    if (realModel.imageUrl.length) {
        [_rightImageView sd_setImageWithURL:[NSURL URLWithString:realModel.imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
//            NSLog(@"down_finish->%@",imageURL);
        }];
    }
}

@end
