//
//  MineTableViewController.m
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "SearchTableViewController.h"
#import "MineViewController.h"
#import "MineHederView.h"
#import "MyDownloadMusicTableViewController.h"
#define kSongsPath [NSHomeDirectory() stringByAppendingString:@"/Documents/songs.arch"]
@interface MineViewController ()<UIScrollViewDelegate>
    @property (strong, nonatomic) IBOutlet UITableViewCell *localCell;
    @property (strong, nonatomic) IBOutlet UITableViewCell *zijianSongListCell;
    @property (strong, nonatomic) IBOutlet UITableViewCell *likeCell;
    @property (strong, nonatomic) IBOutlet UITableViewCell *shoucangCell;
    
    @property (nonatomic,strong)MineHederView * mv;
    @property (strong, nonatomic) IBOutlet UITableViewCell *recentPlayCell;
    @property (strong, nonatomic) IBOutlet UITableViewCell *redomListionCell;
    @property (strong, nonatomic) IBOutlet UITableViewCell *loginCell;
    @property (nonatomic, strong)NSMutableArray *songs;
    @end

@implementation MineViewController
    
    
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.mv = [[[NSBundle mainBundle]loadNibNamed:@"MineHederView" owner:self options:0]firstObject];
    [self.mv.searchBtn addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = self.mv;
    
    [self.tableView bringSubviewToFront:self.tableView.subviews[0]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStyleDone target:self action:@selector(searchAction)];
    
}
    - (void)searchAction{
        SearchTableViewController *vc = [SearchTableViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    -(void)viewWillAppear:(BOOL)animated{
        [super viewWillAppear:animated];
        self.songs = [NSKeyedUnarchiver unarchiveObjectWithFile:kSongsPath];
        
        UILabel *countLabel = self.localCell.contentView.subviews[2];
        countLabel.text = [NSString stringWithFormat:@"共%ld首",self.songs.count];
        
    }
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 9;
}
    
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0)
    {
        
        
        
        
        return self.localCell;
    }
    else if (indexPath.row == 1)
    {
        return self.recentPlayCell;
    }else if (indexPath.row == 2)
    {
        return self.redomListionCell;
    }else if (indexPath.row == 3)
    {
        return self.zijianSongListCell;
    }else if (indexPath.row == 4)
    {
        return self.likeCell;
    }else if (indexPath.row == 5)
    {
        return self.shoucangCell;
    }
    else if (indexPath.row == 6)
    {
        return self.loginCell;
    }
    else
    {
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        return cell;
    }
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        if (indexPath.row == 0)
        {
            return 50;
        }
        else if (indexPath.row == 3 || indexPath.row == 5)
        {
            return 35;
        }
        
        
        return 44;
    }
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        if (indexPath.row == 0)
        {
            MyDownloadMusicTableViewController *mv = [[MyDownloadMusicTableViewController alloc]init];
            mv.localSongs = self.songs;
            
            [self.navigationController pushViewController:mv animated:YES];
        }
    }
    
    
    @end
