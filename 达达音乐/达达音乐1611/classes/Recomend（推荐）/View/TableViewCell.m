//
//  TableViewCell.m
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setRecsong:(Recsong_RSModel *)recsong{
    _recsong = recsong;
    [self.imageView setImageWithURL:recsong.pic_premium];
    self.textLabel.text = recsong.title;
    self.detailTextLabel.text = recsong.author;
    
    
    //圆角
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width/2;
    self.imageView.layer.masksToBounds = YES;
}
-(void)setMod7:(Mod_7RSModel *)mod7{
    _mod7 = mod7;
    [self.imageView setImageWithURL:mod7.pic];
    self.textLabel.text = mod7.title;
    self.detailTextLabel.text = mod7.desc;
    
    //直角
    self.imageView.layer.cornerRadius = 0;
}
@end
