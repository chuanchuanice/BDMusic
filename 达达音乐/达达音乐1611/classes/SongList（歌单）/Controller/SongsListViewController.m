//
//  SongsListViewController.m
//  达达音乐1611
//
//  Created by tarena on 2017/2/23.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "SongListItemModel.h"
#import "HeaderCollectionReusableView.h"
#import "SongsListCollectionViewCell.h"
#import "SongsListViewController.h"

@interface SongsListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)NSArray *songs;
@property (nonatomic, strong)UICollectionView *cv;
@end

@implementation SongsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:fl];
    cv.backgroundColor = [UIColor whiteColor];
    cv.delegate = self;
    cv.dataSource = self;
    self.cv = cv;
    [self.view addSubview:cv];
    [WebUtils requestSongListDataWithCompletion:^(id obj) {
        self.songs = obj;
        [self.cv reloadData];
    }];
    
    
    
    //注册Cell
    [cv registerNib:[UINib nibWithNibName:@"SongsListCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    // 注册footer和header类型的重用标识符
    [cv registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    
}
#pragma mark CollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.songs.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SongsListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    SongListItemModel *slm = self.songs[indexPath.item];
    
    cell.slm = slm;
    
    return cell;
}





- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(95, 127);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 7.5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 7.5;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    // 去重用队列取可用的header
    HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    
    return headerView;
    
}

#pragma mark 设置header和footer高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.bounds.size.width, 30);
}


@end
