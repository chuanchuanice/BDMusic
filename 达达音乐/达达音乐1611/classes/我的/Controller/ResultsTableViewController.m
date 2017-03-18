//
//  HotDetailViewController.m
//  百度音乐
//
//  Created by tarena on 16/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "SongsListCell.h"
#import "PlayingView.h"
#import "ViewUtils.h"
#import "BangDanDetailModel.h"
#import "ResultsTableViewController.h"

@interface ResultsTableViewController ()<UITableViewDelegate,UITableViewDataSource>
    @property (weak, nonatomic) IBOutlet UILabel *titleLabel;
    @property (weak, nonatomic) IBOutlet UIView *naviView;
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    
    @property (nonatomic, strong)NSArray *songs;
    @end

@implementation ResultsTableViewController
- (IBAction)backAction:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.name;
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    
    [self.tableView bringSubviewToFront:self.tableView.subviews[0]];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"SongsListCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    [WebUtils searchSongsWithSongName:self.name andCompletion:^(id obj) {
        self.songs = obj;
 
        [self.tableView reloadData];
    }];
}
    
 
    
    
 
    
    
#pragma mark - TableViewDelegate
    
    
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
