//
//  TableViewCell.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Recsong_RSModel.h"
#import "Mod_7RSModel.h"
@interface TableViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *detailTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong)Recsong_RSModel *recsong;
@property (nonatomic, strong)Mod_7RSModel *mod7;
@end
