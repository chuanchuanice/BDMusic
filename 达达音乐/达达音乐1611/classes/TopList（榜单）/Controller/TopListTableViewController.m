//
//  HotCategoryTableViewController.m
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "HotDetailViewController.h"
 #import "TopListTableViewController.h"
#import "WebUtils.h"
#import "BangDanCell.h"
#import "BangDanModel.h"

@interface TopListTableViewController ()
@property (nonatomic,strong)NSArray *bangdanModelList;
@end

@implementation TopListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 
    
    self.tableView.contentInset = UIEdgeInsetsMake(kSpacing, 0, 0, 0);
    [self.tableView registerNib:[UINib nibWithNibName:@"BangDanCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"bangdancell"];
    
    
    [WebUtils requestHotCategoryDataWithCompletion:^(id obj) {
        
        self.bangdanModelList = obj;
        
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.bangdanModelList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BangDanCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bangdancell" forIndexPath:indexPath];
    
    BangDanModel *bangdan = self.bangdanModelList[indexPath.row];
    
    cell.bangdan = bangdan;
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 85 + kSpacing;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    BangDanModel *bdm = self.bangdanModelList[indexPath.row];
    
    HotDetailViewController *vc = [HotDetailViewController new];
    vc.bangDanModel = bdm;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
