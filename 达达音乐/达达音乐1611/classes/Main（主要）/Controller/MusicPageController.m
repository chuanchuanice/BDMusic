//
//  MusicPageController.m
//  达达音乐1611
//
//  Created by tarena on 2017/2/23.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "MusicPageController.h"

#import "RecommendTableViewController.h"
#import "SongsListViewController.h"
#import "TopListTableViewController.h"
#import "KTVTableViewController.h"

@interface MusicPageController ()

@end

@implementation MusicPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)init
{
    self = [super initWithViewControllerClasses:@[[RecommendTableViewController class],[SongsListViewController class],[TopListTableViewController class],[KTVTableViewController class]] andTheirTitles:@[@"推荐",@"歌单",@"榜单",@"K歌"]];
    if (self) {
        
        
        
    }
    return self;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
