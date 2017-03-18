//
//  RecommentSectionHeaderView.h
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubModel.h"
@interface RecommentSectionHeaderView : UICollectionReusableView
@property (nonatomic, strong) SubModel *module;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;

@end
