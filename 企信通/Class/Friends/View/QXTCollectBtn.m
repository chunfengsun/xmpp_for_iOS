//
//  QXTCollectBtn.m
//  企信通
//
//  Created by 林柏参 on 14/8/6.
//  Copyright (c) 2014年 林柏参. All rights reserved.
//

#define kBiLi 0.55

#import "QXTCollectBtn.h"

@implementation QXTCollectBtn

-(void)awakeFromNib
{
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:10];
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height * kBiLi;
    return CGRectMake(0, 0, w, h);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height * ( 1 - kBiLi);
    CGFloat y = self.frame.size.height * kBiLi;
    return CGRectMake(0, y, w, h);
}


@end
