//
//  TiledView.m
//  TiledLayerDemo
//
//  Created by 夏宁忠 on 2018/1/31.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "TiledView.h"

@implementation TiledView

+(Class)layerClass{
    
    return [CATiledLayer class];
}

-(CATiledLayer *)tiledLayer{
    
    return (CATiledLayer *)self.layer;
}

- (void)drawRect:(CGRect)rect {
    
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.s_name ofType:@"jpg"]];
    UIImage * newimage = [self imageByScalingAndCroppingForSize:CGSizeMake(rect.size.width, rect.size.height) OriginImage:image];
    [newimage drawInRect:rect];
}

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize OriginImage:(UIImage *)sourceImage{
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

-(void)layoutSubviews{
    
    if ([self respondsToSelector:@selector(contentScaleFactor)]) {
        
        self.contentScaleFactor =1.0f;
    }
}

@end
