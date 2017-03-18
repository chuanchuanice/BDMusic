//
//  CenterView.m
//  百度音乐
//
//  Created by tarena on 16/11/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "CenterView.h"
#import "PlayingView.h"
@implementation CenterView

-(void)setSong:(SongModel *)song{
    _song = song;
    
    self.titleLabel.text = song.title;
    self.authorLabel.text = song.author;
    
    [self.artworkIV setImageWithURL:song.album_500_500];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (IBAction)downloadAction:(id)sender {
    
    [[PlayingView shareView] downloadMusic];
    
    
    
}
@end
