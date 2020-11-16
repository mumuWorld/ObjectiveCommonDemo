//
//  MMCustomTextAttachment.m
//  LogDemo
//
//  Created by mumu on 2020/11/12.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMCustomTextAttachment.h"

@implementation MMCustomTextAttachment
//- (nullable UIImage *)imageForBounds:(CGRect)imageBounds textContainer:(nullable NSTextContainer *)textContainer characterIndex:(NSUInteger)charIndex {
//
//}

- (CGRect)attachmentBoundsForTextContainer:(nullable NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex {
    return CGRectMake(-100, 0, 200, 50);
}
@end
