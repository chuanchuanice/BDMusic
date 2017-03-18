//
//  SongsListCollectionViewCell.h
//  百度音乐
//
//  Created by tarena on 2016/10/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongListItemModel.h"

@interface SongsListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headIv;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (nonatomic,strong)SongListItemModel *slm;
@end
