//
//  SongsListCollectionViewCell.m
//  百度音乐
//
//  Created by tarena on 2016/10/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SongsListCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation SongsListCollectionViewCell

 

-(void)setSlm:(SongListItemModel *)slm
{
    _slm = slm;
    
    [self.headIv setImageWithURL:slm.pic_300];
    
    self.title.text = slm.title;
}

@end
