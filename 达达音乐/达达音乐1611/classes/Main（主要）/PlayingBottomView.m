//
//  PlayingBottomView.m
//  达达音乐
//
//  Created by tarena on 16/12/23.
//  Copyright © 2016年 tarena. All rights reserved.
//
#define kSongsPath [NSHomeDirectory() stringByAppendingString:@"/Documents/Download/songs.arch"]

#import "PlayingView.h"
#import "PlayingBottomView.h"
#import "AppDelegate.h"
@implementation PlayingBottomView




-(IBAction)tapAction:(id)sender{
    
    
    
    [[PlayingView shareView] show];
    
}
-(IBAction)nextAction:(id)sender{
    
}
-(IBAction)playBtnAction:(UIButton *)sender{
    if ([PlayingView shareView].isPlaying) {
        [[PlayingView shareView].player pause];
        sender.selected = [PlayingView shareView].playorpauseBtn.selected = NO;
    }else{
        [[PlayingView shareView].player play];
        sender.selected = [PlayingView shareView].playorpauseBtn.selected = YES;
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
