//
//  KTVTableViewController.m
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "WMLoopView.h"
#import "WebUtils.h"
#import "KTVTableViewController.h"
#import "KTVSongModel.h"
@interface KTVTableViewController ()

@property (nonatomic, strong)NSArray *songs;
@end

@implementation KTVTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //请求广告数据
    [WebUtils requestKTVImageURLWithCompletion:^(id obj) {
        
        WMLoopView *loopView = [[WMLoopView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width/2) images:obj autoPlay:YES delay:2];
 
        self.tableView.tableHeaderView = loopView;
        
        
        
    }];
    //请求歌曲列表
    [WebUtils requestKTVSongsWithCompletion:^(id obj) {
        self.songs = obj;
        [self.tableView reloadData];
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==2) {
      return self.songs.count;
    }
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    
    //前两组
    if (indexPath.section<2) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        switch (indexPath.section) {
 
                
            case 0:
                cell.textLabel.text = @"我的K歌";
                cell.imageView.image = [UIImage imageNamed:@"bt_more_ok_normal"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                break;
            case 1:
            {
                UIView *view = [[[NSBundle mainBundle]loadNibNamed:@"KTVView" owner:self options:0]firstObject];
                 [cell addSubview:view];
                cell.clipsToBounds = YES;
            }
                
                break;
        }
            return cell;
     }else{
         UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listcell"];
         
         if (!cell) {
             cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"listcell"];
         }
         KTVSongModel *song = self.songs[indexPath.row];
         cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@",song.song_title,song.artist_name];
         cell.detailTextLabel.text = [NSString stringWithFormat:@"%@人唱过",song.play_num];
         
         
        
         
         
         
         UIImageView *iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bt_list_more_ktv_normal"]];
         iv.frame = CGRectMake(0, 0, 30, 30);
         cell.accessoryView = iv;
         
         [cell.imageView setImageWithURL:song.picture_300_300 placeholderImage:[UIImage imageNamed:@"bt_list_more_ktv_normal"]];
         
         
        return cell;
        
    }
    
    
    

}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        switch (indexPath.section) {
            case 0:
                return 40;
                break;
            case 1:
                return 311;
                break;
         
            default:
                return 60;
 
        }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
