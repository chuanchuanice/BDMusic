//
//  PlayingView.h
//  达达音乐
//
//  Created by tarena on 16/12/23.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "CenterView.h"
#import <UIKit/UIKit.h>
#import "BangDanDetailModel.h"
#import "SongModel.h"
#import "PlayingBottomView.h"
@interface PlayingView : UIView<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)AVPlayer *player;
@property (nonatomic, strong)NSArray *songs;
@property (nonatomic)NSInteger index;
@property (nonatomic, strong)BangDanDetailModel *song;
@property (nonatomic, strong)SongModel *songDetail;

@property (weak, nonatomic) IBOutlet UIButton *playorpauseBtn;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *bottomView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UIScrollView *mainSV;
@property (weak, nonatomic) IBOutlet UIImageView *artworkIV;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *topView;
@property (weak, nonatomic) IBOutlet UIButton *backAction;

@property (nonatomic, strong)UITableView *songListTableView;
@property (nonatomic, strong)UITableView *lrcTableView;
@property (nonatomic, strong)CenterView *centerView;
@property (nonatomic, strong)NSDictionary *lrcDic;
@property (nonatomic, strong)NSArray *keys;
@property (nonatomic) float beginY;
@property (nonatomic, strong)NSMutableData *musicData;

@property (nonatomic)NSInteger currentIndex;

@property (nonatomic)BOOL isPlaying;
- (IBAction)backAction:(id)sender;
- (IBAction)sliderAction:(UISlider *)sender;
- (IBAction)musicControlAction:(UIButton *)sender;

- (void)show;
- (void)dismiss;

+(PlayingView *)shareView;

@property (nonatomic, strong)PlayingBottomView *playingBottomView;
//下载歌曲数据任务
@property (nonatomic, strong)NSURLSessionDataTask *task;



- (void)downloadMusic;
@end
