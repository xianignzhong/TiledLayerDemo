//
//  CollectionViewCell.m
//  TiledLayerDemo
//
//  Created by 夏宁忠 on 2018/1/30.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self aoe_setupView];
    
    [self aoe_setupframe];
}

-(void)aoe_setupView{
    
//    [self addSubview:self.imageView];
    
    [self addSubview:self.tiledView];
}

-(void)aoe_setupframe{
    
//    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    self.tiledView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.tiledView.tiledLayer.tileSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
}


-(void)loadImgWithUrl:(NSString *)url{
    
//    NSString * path = [[NSBundle mainBundle] pathForResource:url ofType:@"jpg"];
//    self.imageView.image = [UIImage imageWithContentsOfFile:path];
    
//    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",url]];
    
    self.tiledView.s_name = url;
    
    [self.tiledView setNeedsDisplay];
}


#pragma mark - setter/getter
-(UIImageView *)imageView{
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return _imageView;
}

-(TiledView *)tiledView{
    
    if (!_tiledView) {
        
        _tiledView = [[TiledView alloc]init];
        _tiledView.tiledLayer.levelsOfDetail = 1;
        _tiledView.tiledLayer.levelsOfDetailBias = 0;
    }
    
    return _tiledView;
}


@end
