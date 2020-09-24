//
//  MMDisplayLayer.m
//  LogDemo
//
//  Created by World on 2020/9/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMDisplayLayer.h"

@implementation MMDisplayLayer

- (void)display {
    super.contents = super.contents;
    __strong id<MMDisplayLayer> delegate = (id)self.delegate;

     UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, self.contentsScale);
             CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (self.opaque && context) {
        CGSize size = self.bounds.size;
        size.width *= self.contentsScale;
        size.height *= self.contentsScale;
        
        CGContextSaveGState(context);
        {
            if (!self.backgroundColor || CGColorGetAlpha(self.backgroundColor) < 1) {
                CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
                CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
                CGContextFillPath(context);
            }
            if (self.backgroundColor) {
                CGContextSetFillColorWithColor(context, self.backgroundColor);
                CGContextAddRect(context, CGRectMake(0, 0, size.width, size.height));
                CGContextFillPath(context);
            }
        }
        CGContextRestoreGState(context);
    }
    
        [delegate display:context size:self.bounds.size];
    
    UIImage *content = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    self.contents = (__bridge id)content.CGImage;
}
@end
