//
//  MyDownloadMusicTableViewController.m
//  百度音乐
//
//  Created by tarena on 2016/11/2.
//  Copyright © 2016年 tarena. All rights reserved.
//
#define kSongsPath [NSHomeDirectory() stringByAppendingString:@"/Documents/songs.arch"]

#import "MyDownloadMusicTableViewController.h"
#import "PlayingView.h"
@interface MyDownloadMusicTableViewController ()

@end

@implementation MyDownloadMusicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"已下载歌曲";
    
 
    
    
    

    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.localSongs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.backgroundColor = [UIColor clearColor];
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
     }
    BangDanDetailModel * dm = self.localSongs[indexPath.row];
    cell.textLabel.text = dm.title;
    cell.detailTextLabel.text = dm.author;
 
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:dm.pic_small];
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imageView.image = [UIImage imageWithData:data];
                [cell setNeedsLayout];
            });
        });
 
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [[PlayingView shareView] show];
    [PlayingView shareView].songs = self.localSongs;
        [PlayingView shareView].currentIndex = indexPath.row;
    [[PlayingView shareView].songListTableView reloadData];

    [PlayingView shareView].song = self.localSongs[indexPath.row];
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
    
    -(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
        
 
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            BangDanDetailModel *dd = self.localSongs[indexPath.row];
            [self.localSongs removeObjectAtIndex:indexPath.row];
            
            [NSKeyedArchiver archiveRootObject:self.localSongs toFile:kSongsPath];
            
            //删除歌曲
            NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@.mp3",dd.title];
            [[NSFileManager defaultManager]removeItemAtPath:path error:nil];
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        } else if (editingStyle == UITableViewCellEditingStyleInsert) {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }   

    }


@end
