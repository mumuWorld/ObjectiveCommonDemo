//
//  UIImageView+MMCategory.m
//  LogDemo
//
//  Created by mumu on 2020/1/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "UIImageView+MMCategory.h"

@implementation UIImageView (MMCategory)
- (void)setImage:(UIImage *)image fitSize:(CGSize)fitSize {
    if (fitSize.width == 0 || fitSize.height == 0) {
        if (self.width == 0 || self.height == 0) {
            NSLog(@"should have fitSize or ImageViewSize");
            return;
        }
        fitSize = self.size;
    }

    CGImageRef tmpImage = image.CGImage;
    if (!tmpImage) {
        NSLog(@"this image don't have cgImage");
        return;
    }
    size_t width = CGImageGetWidth(tmpImage);
    size_t height = CGImageGetHeight(tmpImage);
    CGSize imgSize = CGSizeMake(width, height);
    
    CGFloat widthScale = width / fitSize.width; //横向比例
    CGFloat heightScale = height / fitSize.height; //垂直比例
    
    BOOL horRander = widthScale < heightScale ? true : false;
    
    if (self.contentMode == UIViewContentModeScaleAspectFill) {
        if (horRander) { //水平填满
            CGFloat scaleY = fabs((imgSize.height - fitSize.height * widthScale) * 0.5);
            tmpImage = CGImageCreateWithImageInRect(tmpImage, CGRectMake(0, scaleY, imgSize.width, fitSize.height * widthScale));
        } else { //垂直填满
            CGFloat scaleX = fabs((imgSize.width - fitSize.width * heightScale) * 0.5);
            tmpImage = CGImageCreateWithImageInRect(tmpImage, CGRectMake(scaleX, 0, fitSize.width * heightScale, imgSize.height));
        }
    }
    if (!tmpImage) {
        NSLog(@"draw image failed");
        return;
    }
    self.image = [UIImage imageWithCGImage:tmpImage];
    CGImageRelease(tmpImage);
}
@end
