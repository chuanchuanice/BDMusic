//
//  WeiboTableViewCell.m
//  微博登录
//
//  Created by tarena on 16/10/21.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "WeiboTableViewCell.h"

@implementation WeiboTableViewCell

- (void)awakeFromNib {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.backgroundColor = [UIColor lightGrayColor];

    
    self.headIV.layer.cornerRadius = self.headIV.bounds.size.width/2;
    self.headIV.layer.masksToBounds = YES;
    
    
    self.bottomBar.layer.borderWidth = 1;
    self.bottomBar.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
    
    //初始化时创建weiboView
    self.weiboView = [[WeiboView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headIV.frame)+5, self.bounds.size.width, 0)];
    [self.contentView addSubview:self.weiboView];
    
    
    //给头像和nameLabel添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.headIV addGestureRecognizer:tap];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.nickLabel addGestureRecognizer:tap2];
    
    self.headIV.userInteractionEnabled = self.nickLabel.userInteractionEnabled = YES;
}

-(void)tapAction{
 
    

    
}

-(void)setMessage:(MessageModel *)message{
    _message = message;
    
    self.nickLabel.text = message.author.username;
    [self.headIV setImageWithURL:message.author.userpic_small];
    [self.repostBtn setTitle:message.share_num forState:UIControlStateNormal];
     [self.commentBtn setTitle:message.comment_num forState:UIControlStateNormal];
     [self.attBtn setTitle:message.zan_num forState:UIControlStateNormal];
    
    
    self.timeLabel.text = message.ctime;
    
    
    //更新weiboView的高度
   
    //更新位置
    CGRect frame = self.weiboView.frame;
    frame.size.height = [message messageHeight];
    self.weiboView.frame = frame;
    self.weiboView.message = message;
    
    [self.songIV setImageWithURL:message.content.pic];
    self.songTitleLabel.text = message.content.title;
    self.artistLabel.text = message.content.artist_name;
}



@end
