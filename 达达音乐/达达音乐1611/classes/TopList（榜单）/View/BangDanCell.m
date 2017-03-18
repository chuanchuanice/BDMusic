//
//  BangDanCell.m
//  百度音乐
//
//  Created by tarena on 2016/10/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BangDanCell.h"
#import "UIImageView+AFNetworking.h"
#import "BangDanSongsModel.h"
@implementation BangDanCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
}

-(void)setBangdan:(BangDanModel *)bangdan
{
    _bangdan = bangdan;
    
    [self.headIV setImageWithURL:bangdan.pic_s192];
    
    for (int i = 0 ; i < self.songName.count; i++)
    {
        BangDanSongsModel *sm = bangdan.content[i];
        
        ((UILabel*)self.songName[i]).text = [NSString stringWithFormat:@"%@-%@",sm.title,sm.author];
    }
}

 

@end
