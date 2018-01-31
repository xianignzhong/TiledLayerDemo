//
//  CollectionViewCell.h
//  TiledLayerDemo
//
//  Created by 夏宁忠 on 2018/1/30.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TiledView.h"

@interface CollectionViewCell : UICollectionViewCell

@property (nonatomic, strong)UIImageView * imageView;

@property (nonatomic, strong)TiledView * tiledView;

-(void)loadImgWithUrl:(NSString *)url;

@end
