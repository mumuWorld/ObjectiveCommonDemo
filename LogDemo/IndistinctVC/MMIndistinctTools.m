//
//  MMIndistinctTools.m
//  LogDemo
//
//  Created by mumu on 2020/1/14.
//  Copyright © 2020 mumu. All rights reserved.
//

#import "MMIndistinctTools.h"
#import <pthread.h>

@import Accelerate;

static pthread_mutex_t lock;

@implementation MMIndistinctTools

+ (void)initialize {
    pthread_mutex_init(&lock, NULL);
}

+ (void)createIndistinctImage:(CGFloat)blur size:(CGSize)size style:(int)style finish:(void (^)(UIImage *image))finish {
    pthread_mutex_lock(&lock);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CFTimeInterval start = CFAbsoluteTimeGetCurrent();
        UIImage *finishImg = nil;
        NSString *taskName = nil;
        if (style == 0) {
            taskName = @"CoreImage";
            finishImg = [self createIndistinctImageByCoreImage:blur size:size];
        } else if (style == 1) {
            taskName = @"vImage";
            finishImg = [self createIndistinctImageByVImage:blur size:size];
        } else if (style == 2) {
            taskName = @"vImage_2";
            finishImg = [self createImageByVImage2:blur size:size];
        }
        CFTimeInterval end = CFAbsoluteTimeGetCurrent() - start;
           NSLog(@"%@ -> %f",taskName,end);
        dispatch_sync(dispatch_get_main_queue(), ^{
            finish(finishImg);
        });
    });
    pthread_mutex_unlock(&lock);
}

+ (UIImage *)createIndistinctImageByCoreImage:(CGFloat)blur size:(CGSize)size {
    CIContext *context = [CIContext contextWithOptions:nil];
    UIImage *source = [UIImage imageNamed:@"1"];
    CIImage *inputImage = [[CIImage alloc]initWithImage:source];
    
    // create gaussian blur filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:blur] forKey:@"inputRadius"];
    
    // blur image
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
//    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    CGImageRef cgImage = [context createCGImage:result fromRect:CGRectMake(0, 0, source.size.width, source.size.height)];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    return image;
}

+ (UIImage *)createIndistinctImageByVImage:(CGFloat)blur size:(CGSize)size {
    UIImage *image = [UIImage imageNamed:@"1"];

    if(blur < 0.f || blur > 1.f) {
        blur = 0.5f;
    }
    
    int boxSize = (int)(blur * 100);
    boxSize = boxSize - (boxSize % 2) + 1;
    CGImageRef img = image.CGImage;
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    
    void*pixelBuffer;
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    inBuffer.width = CGImageGetWidth(img);
    
    inBuffer.height = CGImageGetHeight(img);
    
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) *
                         
                         CGImageGetHeight(img));
    
    if(pixelBuffer == NULL)
        
        NSLog(@"No pixelbuffer");
    
    outBuffer.data = pixelBuffer;
    
    outBuffer.width = CGImageGetWidth(img);
    
    outBuffer.height = CGImageGetHeight(img);
    
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    error = vImageBoxConvolve_ARGB8888(&inBuffer,
                                       &outBuffer,
                                       NULL,
                                       0,
                                       0,
                                       boxSize,
                                       boxSize,
                                       NULL,
                                       kvImageEdgeExtend);
    
    if(error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             kCGImageAlphaNoneSkipLast);
    
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    free(pixelBuffer);

    CFRelease(inBitmapData);
    CGColorSpaceRelease(colorSpace);
    CGImageRelease(imageRef);
    return returnImage;
}

+ (UIImage *)createImageByVImage2:(CGFloat)blur size:(CGSize)pSize {
    UIImage *sourceImage = [UIImage imageNamed:@"1"];
//    CGSize size = CGSizeMake(ScreenWidth, 200);
    CGSize size = sourceImage.size;

    CGImageRef cgImage = sourceImage.CGImage;
    CGFloat blurRadius = blur;
    CGFloat saturationDeltaFactor = 1.8;
    UIImage *maskImage = nil;
    UIColor *tintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    if (size.width < 1 || size.height < 1) {
      NSLog (@"*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@", size.width, size.height, self);
      return nil;
    }
    if (!cgImage) {
      NSLog (@"*** error: image must be backed by a CGImage: %@", self);
      return nil;
    }
    if (maskImage && !maskImage.CGImage) {
      NSLog (@"*** error: maskImage must be backed by a CGImage: %@", maskImage);
      return nil;
    }
    
    CGRect imageRect = { CGPointZero, size };
    UIImage *effectImage = sourceImage;
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    BOOL hasSaturationChange = fabs(saturationDeltaFactor - 1.) > __FLT_EPSILON__;
    if (hasBlur || hasSaturationChange) {
      UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
      CGContextRef effectInContext = UIGraphicsGetCurrentContext();
      CGContextScaleCTM(effectInContext, 1.0, -1.0);
      CGContextTranslateCTM(effectInContext, 0, -size.height);
      CGContextDrawImage(effectInContext, imageRect, cgImage);
      
      vImage_Buffer effectInBuffer;
      effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
      effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
      effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
      effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
      
      UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
      CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
      vImage_Buffer effectOutBuffer;
      effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
      effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
      effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
      effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
      
      if (hasBlur) {
        // A description of how to compute the box kernel width from the Gaussian
        // radius (aka standard deviation) appears in the SVG spec:
        // http://www.w3.org/TR/SVG/filters.html#feGaussianBlurElement
        //
        // For larger values of 's' (s >= 2.0), an approximation can be used: Three
        // successive box-blurs build a piece-wise quadratic convolution kernel, which
        // approximates the Gaussian kernel to within roughly 3%.
        //
        // let d = floor(s * 3*sqrt(2*pi)/4 + 0.5)
        //
        // ... if d is odd, use three box-blurs of size 'd', centered on the output pixel.
        //
        CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
        uint32_t radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
        if (radius % 2 != 1) {
          radius += 1; // force radius to be odd so that the three box-blur methodology works.
        }
        vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
      }
      BOOL effectImageBuffersAreSwapped = NO;
      if (hasSaturationChange) {
        CGFloat s = saturationDeltaFactor;
        CGFloat floatingPointSaturationMatrix[] = {
          0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
          0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
          0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
          0,                    0,                    0,  1,
        };
        const int32_t divisor = 256;
        NSUInteger matrixSize = sizeof(floatingPointSaturationMatrix)/sizeof(floatingPointSaturationMatrix[0]);
        int16_t saturationMatrix[matrixSize];
        for (NSUInteger i = 0; i < matrixSize; ++i) {
          saturationMatrix[i] = (int16_t)roundf(floatingPointSaturationMatrix[i] * divisor);
        }
        if (hasBlur) {
          vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
          effectImageBuffersAreSwapped = YES;
        }
        else {
          vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, divisor, NULL, NULL, kvImageNoFlags);
        }
      }
      if (!effectImageBuffersAreSwapped)
        effectImage = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      
      if (effectImageBuffersAreSwapped)
        effectImage = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
    
    // Set up output context.
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -size.height);
    
    // Draw base image.
    CGContextDrawImage(outputContext, imageRect, cgImage);
    
    // Draw effect image.
    if (hasBlur) {
      CGContextSaveGState(outputContext);
      if (maskImage) {
        CGContextClipToMask(outputContext, imageRect, maskImage.CGImage);
      }
      CGContextDrawImage(outputContext, imageRect, effectImage.CGImage);
      CGContextRestoreGState(outputContext);
    }
    
    // Add in color tint.
    if (tintColor) {
      CGContextSaveGState(outputContext);
      CGContextSetFillColorWithColor(outputContext, tintColor.CGColor);
      CGContextFillRect(outputContext, imageRect);
      CGContextRestoreGState(outputContext);
    }
    
    // Output image is ready.
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}
@end
