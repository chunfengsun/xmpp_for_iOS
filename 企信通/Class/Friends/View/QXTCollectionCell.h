//
//  QXTCollectionCell.h
//  企信通
//
//  Created by 林柏参 on 14/8/6.
//  Copyright (c) 2014年 林柏参. All rights reserved.
//

/**
 *  注意: 如果自定义按钮 想点击collection的时候 是不能点的 需要把自定义按钮的userInteractionEnabled 去掉 即可~~~~
 */

#import <UIKit/UIKit.h>

@class QXTCollectBtn;

@interface QXTCollectionCell : UICollectionViewCell
{
    QXTCollectBtn   *_collectBtn;
}

@property (nonatomic,strong) IBOutlet QXTCollectBtn   *collectBtn;

@end
