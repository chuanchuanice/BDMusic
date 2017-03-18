//
//  HotDetailViewController.m
//  百度音乐
//
//  Created by tarena on 16/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "PlayingView.h"
#import "ViewUtils.h"
 #import "BangDanDetailModel.h"
#import "HotDetailViewController.h"
#import "HotDetailHeaderView.h"
@interface HotDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *naviView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)HotDetailHeaderView *headerView;
@property (nonatomic, strong)NSArray *songs;
@end

@implementation HotDetailViewController
- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.bangDanModel.name;
    //创建表头
    self.headerView = [[[NSBundle mainBundle]loadNibNamed:@"HotDetailHeaderView" owner:self options:0] firstObject];
    self.headerView.height = 200;
    self.tableView.tableHeaderView = self.headerView;
 
    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
     [self.tableView bringSubviewToFront:self.tableView.subviews[0]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SongsListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    [WebUtils requestBangDanDetailWithType:self.bangDanModel.type andCompletion:^(id obj) {
       
        self.songs = obj[@"bangdanModelArr"];
        
        self.headerView.headerDic = obj[@"headerDic"];
        [self.tableView reloadData];
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
 
}


#pragma mark - TableViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.headerView updateSubViewsWithOffsetY:scrollView.contentOffset.y];
    //控制导航显示不显示
    if (scrollView.contentOffset.y>200-64) {
        [UIView animateWithDuration:.35 animations:^{
          self.naviView.alpha = 1;
        }];
        
    }else{
        [UIView animateWithDuration:.35 animations:^{
            self.naviView.alpha = 0;
        }];
    
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.songs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SongsListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    BangDanDetailModel *bdm = self.songs[indexPath.row];
    
    cell.bdm = bdm;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[[NSBundle mainBundle]loadNibNamed:@"BangdanDetailSectionView" owner:self options:0]firstObject];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [PlayingView shareView].songs = self.songs;
    [[PlayingView shareView].songListTableView reloadData];
    [PlayingView shareView].currentIndex = indexPath.row;
    [[PlayingView shareView]show];
    
    [PlayingView shareView].song = self.songs[indexPath.row];
    
}
 

@end
