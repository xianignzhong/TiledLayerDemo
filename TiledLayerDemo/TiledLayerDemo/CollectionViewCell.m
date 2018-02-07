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
}

-(void)loadImgWithUrl:(NSString *)url{
    
    [self.tiledView removeFromSuperview];
    self.tiledView = nil;

    if (!self.tiledView) {

        self.tiledView = [[TiledView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        self.tiledView.tiledLayer.tileSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
        self.tiledView.tiledLayer.levelsOfDetail = 2;
        self.tiledView.tiledLayer.levelsOfDetailBias = 0;
        [self addSubview:self.tiledView];
    }

    self.tiledView.s_name = url;
}


@end
