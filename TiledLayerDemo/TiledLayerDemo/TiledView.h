//
//  TiledView.h
//  TiledLayerDemo
//
//  Created by 夏宁忠 on 2018/1/31.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface TiledView : UIView

@property (nonatomic, assign)CGRect rect;

@property (nonatomic, copy)NSString * s_name;

@property (nonatomic, readonly)CATiledLayer *tiledLayer;

@end
