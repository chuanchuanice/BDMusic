//
//  RecommendTableViewController.m
//  达达音乐1611
//
//  Created by tarena on 2017/2/23.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "ReCollectionViewCell.h"
#import "RecommentSectionHeaderView.h"
#import "RootModel.h"
#import "RecommendTableViewController.h"
#import "HomeLoopView.h"
#import "EntryCell.h"
#import "HotCell.h"
#import "TableViewCell.h"
@interface RecommendTableViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)RootModel *rootModel;
@property (nonatomic, strong)UICollectionView *cv;
@property (nonatomic, strong)HomeLoopView *loopView;
@end

@implementation RecommendTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
    UICollectionView *cv = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:fl];
    cv.backgroundColor = [UIColor whiteColor];
    cv.delegate = self;
    cv.dataSource = self;
    self.cv = cv;
    [self.view addSubview:cv];
    
    [WebUtils requestRecomentedWithCompletion:^(id obj) {
        self.rootModel = obj;
        [self.cv reloadData];
    }];
 
    //注册系统cell
    [cv registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    // 注册自定义的header
    [self.cv registerNib:[UINib nibWithNibName:@"RecommentSectionHeaderView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
    
    [self.cv registerNib:[UINib nibWithNibName:@"EntryCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"entryCell"];
  
    [self.cv registerNib:[UINib nibWithNibName:@"HotCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"hotCell"];
    
    [self.cv registerClass:[ReCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    
    [self.cv registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"tableViewCell"];

}

#pragma mark CollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.rootModel.module.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
        case 2:
            return 1;
        case 3:case 5:case 11:case 12:
            return 6;
        case 6:case 10:
            return 3;
            case 8:
            return 4;
        case 9:
            return self.rootModel.result.recsong.result.count;
        case 13:
            return self.rootModel.result.mod_7.result.count;
    }
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = nil;
    switch (indexPath.section) {
        case 0:
        {
          cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            
            if (!self.loopView) {
                self.loopView = [[HomeLoopView alloc]initWithFrame:CGRectMake(0, 0, kSW, kSW/2) images:self.rootModel.result.focus.result autoPlay:YES delay:2];
                [cell addSubview:self.loopView];
            }
            
            
        }
            break;
        case 1:
        {
            EntryCell *eCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"entryCell" forIndexPath:indexPath];
            
            eCell.entry = self.rootModel.result.entry.result[indexPath.row];
            cell = eCell;
           
            
        }
             break;
        case 2:
        {
            HotCell *hCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"hotCell" forIndexPath:indexPath];
            
            hCell.mix2 = self.rootModel.result.mix_2.result.firstObject;
            cell = hCell;
            
        }
            break;
             case 3:
        {
            ReCollectionViewCell *rCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
            rCell.diy = self.rootModel.result.diy.result[indexPath.row];
            cell = rCell;
         }
            break;
        case 5:
        {
            ReCollectionViewCell *rCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
            rCell.diy = self.rootModel.result.album.result[indexPath.row];
            cell = rCell;
        }
            break;
        case 6:
        {
            ReCollectionViewCell *rCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
            rCell.diy = self.rootModel.result.mix_22.result[indexPath.row];
            cell = rCell;
        }
            break;
        case 8:
        {
            EntryCell *eCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"entryCell" forIndexPath:indexPath];
            
            eCell.scence = self.rootModel.result.scene.result.action[indexPath.row];
            cell = eCell;
            
            
        }
            break;
        case 9:
        {
            TableViewCell *tCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tableViewCell" forIndexPath:indexPath];
            
            tCell.recsong = self.rootModel.result.recsong.result[indexPath.row];
            cell = tCell;
            
            
        }
            break;
        case 10:
        {
            ReCollectionViewCell *rCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
            rCell.diy = self.rootModel.result.mix_9.result[indexPath.row];
            cell = rCell;
        }
            break;
        case 11:
        {
            ReCollectionViewCell *rCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
            rCell.diy = self.rootModel.result.mix_5.result[indexPath.row];
            cell = rCell;
        }
            break;
        case 12:
        {
            ReCollectionViewCell *rCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
            rCell.diy = self.rootModel.result.radio.result[indexPath.row];
            cell = rCell;
        }
            break;
        case 13:
        {
            TableViewCell *tCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"tableViewCell" forIndexPath:indexPath];
            
            tCell.mod7 = self.rootModel.result.mod_7.result[indexPath.row];
            cell = tCell;
            
            
        }
            break;
    }
    
    
    return cell;
}





- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(kSW, kSW/2);
            break;
        case 1:
        {
            int size = (kSW-4*kSpacing)/3;
            
            return CGSizeMake(size, size);
        }
            break;
        case 2:
    
            return CGSizeMake(kSW, 70);
        case 3:case 5:case 6:case 10:case 11:case 12:
        {
            float size = (kSW-4*kSpacing)/3;
            return CGSizeMake(size, size+30);
        }
            case 8:
        {
            float size = (kSW-5*kSpacing)/4;
            return CGSizeMake(size, size+20);
        }
        case 9:case 13:
            return CGSizeMake(kSW, 50);
    }
    
    
    
    return CGSizeMake(0, 0);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    switch (section) {
        case 3:case 5:case 11:case 12:
            return UIEdgeInsetsMake(0, kSpacing, 0, kSpacing);
            break;
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}





- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    // 去重用队列取可用的header
    RecommentSectionHeaderView *headerView = (RecommentSectionHeaderView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    
    headerView.module = self.rootModel.module[indexPath.section];
    
    return headerView;
    
}

#pragma mark 设置header和footer高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    SubModel *subM = self.rootModel.module[section];
    
    
    if (subM.picurl.description.length>0) {
          return CGSizeMake(kSW, 30);
    }
    return CGSizeZero;
}

@end
