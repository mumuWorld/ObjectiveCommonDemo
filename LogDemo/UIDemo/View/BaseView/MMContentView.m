//
//  MMContentView.m
//  LogDemo
//
//  Created by World on 2020/9/24.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMContentView.h"
#import "MMDisplayLayer.h"

@interface MMContentView () <MMDisplayLayer>
@property (nonatomic, assign) CGFloat contentsScale;
@end

@implementation MMContentView

+ (Class)layerClass {
    return [MMDisplayLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _contentsScale = [UIScreen mainScreen].scale;
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
        _configure = [[MMRadiusConfigure alloc] init];
        _configure.rectCorner = 0;
        _configure.cornerRaidus = 0;
    }
    return self;
}

- (void)_clearContents {
    CGImageRef image = (__bridge_retained CGImageRef)(self.layer.contents);
    self.layer.contents = nil;
    if (image) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
            CFRelease(image);
        });
    }
}

- (void)setConfigure:(MMRadiusConfigure *)configure {
    self.layer.contents = nil;
    if (configure.rectCorner != _configure.rectCorner && configure.cornerRaidus != _configure.cornerRaidus) {
       
        [self _clearContents];
        _configure = configure;
        [self.layer setNeedsDisplay];
        
    }
}

- (void)display:(CGContextRef)context size:(CGSize)size {
    CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:_configure.rectCorner cornerRadii:CGSizeMake(_configure.cornerRaidus, _configure.cornerRaidus)];

    [path closePath];
    CGContextFillPath(context);
    CGContextEOClip(context);
    
    //        CGPathAddEllipseInRect(path, NULL, bounds);//这句话就是剪辑作用
    
    CGContextClip(context);
}

@end


@implementation MMRadiusConfigure


@end
