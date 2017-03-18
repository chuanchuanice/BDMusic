//
//  HotCell.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mix_2RSModel.h"
@interface HotCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, strong)Mix_2RSModel *mix2;
@end
