//
//  ReCollectionViewCell.h
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Diy_RSModel.h"
#import "Mix_2RSModel.h"
@interface ReCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong)UIImageView *picIV;
@property (nonatomic, strong)UILabel *titileLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)Diy_RSModel *diy;
 
@end
