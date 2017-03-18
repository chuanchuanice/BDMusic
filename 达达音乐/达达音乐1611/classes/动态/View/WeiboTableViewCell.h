//
//  WeiboTableViewCell.h
//  微博登录
//
//  Created by tarena on 16/10/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
#import "WeiboView.h"
@interface WeiboTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *artistLabel;
@property (weak, nonatomic) IBOutlet UILabel *songTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *songIV;


@property (weak, nonatomic) IBOutlet UIButton *attBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *repostBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headIV;
@property (nonatomic, strong)MessageModel *message;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;

@property (nonatomic, strong)WeiboView *weiboView;

@end
