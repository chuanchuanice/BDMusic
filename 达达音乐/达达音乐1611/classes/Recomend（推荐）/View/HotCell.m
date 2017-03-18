//
//  HotCell.m
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "HotCell.h"

@implementation HotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setMix2:(Mix_2RSModel *)mix2{
    _mix2 = mix2;
    
    [self.imageView setImageWithURL:mix2.pic];
    self.titleLabel.text = mix2.title;
    self.desLabel.text = mix2.desc;
}

@end
