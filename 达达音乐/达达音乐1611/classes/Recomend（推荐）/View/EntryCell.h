//
//  EntryCell.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry_RSModel.h"
#import "ScenceRS_ActModel.h"
@interface EntryCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong)Entry_RSModel *entry;

@property (nonatomic, strong)ScenceRS_ActModel *scence;

@end
