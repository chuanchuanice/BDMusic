//
//  ReCollectionViewCell.m
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "ReCollectionViewCell.h"

@implementation ReCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.picIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        [self.contentView addSubview:self.picIV];
        self.titileLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picIV.frame), frame.size.width, 30)];
        self.titileLabel.font = [UIFont systemFontOfSize:11];
        self.titileLabel.numberOfLines = 2;
        [self.contentView addSubview:self.titileLabel];
        
        self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titileLabel.frame), frame.size.width, 25)];
        self.detailLabel.font = [UIFont systemFontOfSize:10];
        self.detailLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.detailLabel];
        
     }
    return self;
}
-(void)setDiy:(Diy_RSModel *)diy{
    _diy = diy;
    
    [self.picIV setImageWithURL:diy.pic];
    self.titileLabel.text = diy.title;
 
}
@end
