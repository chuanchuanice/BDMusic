//
//  BangDanCell.h
//  百度音乐
//
//  Created by tarena on 2016/10/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BangDanModel.h"

@interface BangDanCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *songName;
 @property (nonatomic,strong)BangDanModel *bangdan;
@end
