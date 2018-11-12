//
//  UICustomItemView.m
//  控件系数-03
//
//  Created by 张玺 on 16/8/1.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "UICustomItemView.h"
#import "UIView+Extension.h"
#import "UICustomCollectionCell.h"
#define CELL_INDENTIFER  @"collectionviewcell"

@interface UICustomItemView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView  *  collectionView;   
@end
@implementation UICustomItemView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titileData = [NSMutableArray  array];
        _contentData = [NSMutableArray  array];
        for (int  i=0; i<10; i++) {
            [_titileData  addObject:[NSString  stringWithFormat:@"标题%d",i]];
            [_contentData addObject:[NSString stringWithFormat:@"内容好多呀呀呀呀%d",i]];
        }
        
        [self  setUpCollectionView];
    }
    return self;
}
- (void)setUpCollectionView
{
    self.backgroundColor = [UIColor cyanColor];
     UICollectionViewFlowLayout  *layout=[[UICollectionViewFlowLayout  alloc]init];
    //layout.itemSize=CGSizeMake(175, 60);
    layout.minimumLineSpacing = 3;
    
    _collectionView = [[UICollectionView  alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    [_collectionView  registerClass:[UICustomCollectionCell  class] forCellWithReuseIdentifier:CELL_INDENTIFER];
    [self  addSubview:_collectionView];
    _collectionView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    _collectionView.delegate = self;
    _collectionView.dataSource =self;
    _collectionView.backgroundColor = [UIColor cyanColor];
}
#pragma mark - UICollectionView Deleagte
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _titileData.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICustomCollectionCell  * cell  = [collectionView  dequeueReusableCellWithReuseIdentifier:CELL_INDENTIFER forIndexPath:indexPath];
    if (!cell) {
        cell = [[UICustomCollectionCell  alloc]initWithFrame:CGRectMake(0, 0, self.width/2, 44)];
    }
    [cell  setItemTitleWithData:[_titileData  objectAtIndex:indexPath.row]];
    [cell  setItemContentWithData:[_contentData  objectAtIndex:indexPath.row]];
  // cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0  alpha:1];
    cell.backgroundColor = [UIColor  whiteColor];
    return cell;
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(self.width/2, 44);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,0,0,0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
@end
