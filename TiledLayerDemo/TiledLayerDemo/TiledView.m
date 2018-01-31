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
    
    
    
    [image drawInRect:rect];
}

-(void)layoutSubviews{
    
    if ([self respondsToSelector:@selector(contentScaleFactor)]) {
        
        self.contentScaleFactor = 1.0f;
    }
}

@end
