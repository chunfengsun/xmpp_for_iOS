//
//  QXTCollectionView.m
//  企信通
//
//  Created by 林柏参 on 14/8/6.
//  Copyright (c) 2014年 林柏参. All rights reserved.
//

#import "QXTCollectionView.h"
#import "QXTCollectionCell.h"
#import "QXTCollectBtn.h"

@interface QXTCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray *_dataList;
    NSArray *_allArray;
}

@property (weak, nonatomic)UICollectionView *conllectionView;

@end

@implementation QXTCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        _dataList = [NSArray array];
        _dataList = @[@"照片",@"拍照",@"位置",@"名片",@"我的收藏",@"实时对讲机",@"视频聊天",@"语言输入"];
        
        _allArray = [NSArray array];
        _allArray = @[@"tabbar_me",@"tabbar_me",@"tabbar_me",@"tabbar_me",@"tabbar_me",@"tabbar_me",@"tabbar_me",@"tabbar_me",@"tabbar_me"];
        
        [self setupView];
        
        [self setupViewFrame];
    }
    return self;
}

-(void)setupViewFrame
{
    CGRect screenFrame = [UIScreen mainScreen].applicationFrame;
    CGFloat wh = screenFrame.size.width / 3;
    CGRect frame = self.frame;
    frame.size.height = ((_dataList.count % 4) ? (_dataList.count / 4) + 1:(_dataList.count / 4)) * wh ;
    self.frame = frame;
    [self.conllectionView reloadData];
}

- (void)setupView {
    CGRect screenFrame = [UIScreen mainScreen].applicationFrame;
    CGFloat wh = screenFrame.size.width / 5;
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.itemSize = CGSizeMake(wh, wh);
    flow.minimumInteritemSpacing = 10;
    flow.minimumLineSpacing = 30;
    flow.sectionInset = UIEdgeInsetsMake(30, 10, 10, 10);
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flow];
    [collectionView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    _conllectionView = collectionView;
    [_conllectionView setDelegate:self];
    [_conllectionView setDataSource:self];
    
    [_conllectionView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:_conllectionView];
    
    [_conllectionView registerNib:[UINib nibWithNibName:@"QXTCollectionCell"  bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"QXTCollectionCell"];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataList.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    QXTCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QXTCollectionCell" forIndexPath:indexPath];
    
    [cell.collectBtn setTitle:[NSString stringWithFormat:@"%@",[_dataList objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
    
    [cell.collectBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[_allArray objectAtIndex:indexPath.row]]] forState:UIControlStateNormal];
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@" 你点击了第 %d 个帅锅",indexPath.row);
}

@end
