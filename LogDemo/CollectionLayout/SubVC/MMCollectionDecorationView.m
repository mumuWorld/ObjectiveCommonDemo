//
//  MMCollectionDecorationView.m
//  UICollectionViewDemo
//
//  Created by mumu on 2020/1/17.
//  Copyright © 2020 CHC. All rights reserved.
//

#import "MMCollectionDecorationView.h"

@implementation MMCollectionDecorationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
//        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, frame.size.width - 20, frame.size.height - 20)];
//        UIImage *image = [UIImage imageNamed:@"bg"];
//        _imageView.image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
//        [self addSubview:_imageView];
    }
    
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    NSLog(@"%s", __func__);
//
//    _imageView.frame = CGRectMake(10, 10, layoutAttributes.frame.size.width - 20, layoutAttributes.frame.size.height - 20);
}

@end
