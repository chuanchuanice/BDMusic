//
//  BangDanXiangXiCell.h
//  百度音乐
//
//  Created by tarena on 2016/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BangDanDetailModel.h"

@interface SongsListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@property (weak, nonatomic) IBOutlet UIImageView *SQIV;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UIImageView *MVIV;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong)BangDanDetailModel *bdm;


@end
