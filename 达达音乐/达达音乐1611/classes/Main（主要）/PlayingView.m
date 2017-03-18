//
//  PlayingView.m
//  达达音乐
//
//  Created by tarena on 16/12/23.
//  Copyright © 2016年 tarena. All rights reserved.
//
#define kSongsPath [NSHomeDirectory() stringByAppendingString:@"/Documents/songs.arch"]
#import "AFNetworking.h"
#import "Utils.h"
#import "AppDelegate.h"
#import "PlayingView.h"
static PlayingView *_playingView;
@implementation PlayingView

+(PlayingView *)shareView{
    if (!_playingView) {
        _playingView = [[[NSBundle mainBundle]loadNibNamed:@"PlayingView" owner:self options:nil]lastObject];
        _playingView.player = [AVPlayer new];
        
   
    }
    
    return _playingView;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    //后台播放，设置会话类型。
    AVAudioSession *session = [AVAudioSession sharedInstance];
    //类型是:播放和录音。
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    //而且要激活，音频会话。
    [session setActive:YES error:nil];
    
    
    //创建毛玻璃特效
    UIBlurEffect *eff = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    //特效视图
    UIVisualEffectView *ve = [[UIVisualEffectView alloc]initWithEffect:eff];
    ve.frame = self.artworkIV.frame;
    //把毛玻璃视图添加到控件中
    [self.artworkIV addSubview:ve];
    
    
    //初始化MainSV里面的控件
    [self initUI];
    
    
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    
    
    
    //得到之前保存的数组和下标
    self.songs = [NSKeyedUnarchiver unarchiveObjectWithFile:kSongsPath];
    if (self.songs>0) {
        BangDanDetailModel *song = self.songs[0];
        self.song = song;
    }
   
    
           [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(finishAction) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)updateUI{
    //得到歌曲当前播放的时间
    float currentTime = self.player.currentTime.value*1.0/self.player.currentTime.timescale;
    
     self.progressSlider.value = currentTime;
    
    self.playingBottomView.progressView.progress = currentTime/self.songDetail.file_duration.floatValue;
    
    
    //    处理歌词
    for (int i=0; i<self.keys.count; i++) {
        
        float time = [self.keys[i]floatValue];
        
        if (time > currentTime) {
            
            int row = i==0?0:i-1;
            //让tableView选中某一行
            [self.lrcTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            
            break;
        }
        
    }
    
    
}
- (void)initUI{
    //歌曲列表的tableView
    self.songListTableView = [[UITableView alloc]initWithFrame:self.mainSV.bounds style:UITableViewStylePlain];
    self.songListTableView.delegate = self;
    self.songListTableView.dataSource = self;
    
    [self.mainSV addSubview:self.songListTableView];
    //歌曲详情
    self.centerView = [[[NSBundle mainBundle]loadNibNamed:@"CenterView" owner:self options:nil]firstObject];
    self.centerView.left = kSW;
    [self.mainSV addSubview:self.centerView];
    
    //显示歌词的tableView
    self.lrcTableView = [[UITableView alloc]initWithFrame:self.mainSV.bounds style:UITableViewStylePlain];
    //没有线
    self.lrcTableView.separatorStyle = self.songListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.lrcTableView.left = 2*kSW;
    self.lrcTableView.delegate = self;
    self.lrcTableView.dataSource = self;
    //因为同一个类中用到了两个tableView
    self.lrcTableView.tag = 1;
    
  
    [self.mainSV addSubview:self.lrcTableView];
    
    self.mainSV.contentSize = CGSizeMake(3*kSW, 0);
    self.mainSV.pagingEnabled = YES;
    self.mainSV.contentOffset = CGPointMake(kSW, 0);
    
    //两个tableView的背景透明
    self.lrcTableView.backgroundColor = self.songListTableView.backgroundColor = [UIColor clearColor];
    
    
}
-(void)show{
    //把自己从父视图中提高到最上面
    [self.superview bringSubviewToFront:self];
    [UIView animateWithDuration:.5
                     animations:^{
                         self.top = 0; 
                     }];
    
}
-(void)dismiss{
    
    [UIView animateWithDuration:.5
                     animations:^{
                         self.top = kSH;
                     }];
    
}

- (IBAction)backAction:(id)sender{
    [self dismiss];
}
- (IBAction)sliderAction:(UISlider *)sender{
    
    [self.player pause];
    
    [self.player seekToTime:CMTimeMakeWithSeconds(sender.value, self.player.currentTime.timescale) completionHandler:^(BOOL finished) {
        if (finished) {
            [self.player play];
        }
    }];

    
    
    
}
- (IBAction)musicControlAction:(UIButton *)sender{
    
    if (sender.tag==0) {
        
        if (self.isPlaying) {
           
            [self.player pause];
             self.isPlaying = NO;
            sender.selected = self.playingBottomView.playBtn.selected = NO;
        }else{
            [self.player play];
            self.isPlaying = YES;
            sender.selected = self.playingBottomView.playBtn.selected =YES;
        }
        
    }else if (sender.tag==1){//上一曲
        
        self.currentIndex--;
        if (self.currentIndex==-1) {
            self.currentIndex = self.songs.count-1;
        }
        
        self.song = self.songs[self.currentIndex];
        
    }else{//下一曲
        self.currentIndex++;
        if (self.currentIndex==self.songs.count) {
            self.currentIndex = 0;
        }
        
        self.song = self.songs[self.currentIndex];
    }
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:[UIApplication sharedApplication].keyWindow];
    self.beginY = p.y;
    
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:[UIApplication sharedApplication].keyWindow];
    
    float offsetY = p.y-self.beginY;
    self.y += offsetY;
    
    //每次以移动完之后的坐标为下一次的起始坐标
    self.beginY = p.y;
    
    
    if (self.top<=0) {
        self.top = 0;
    }
    
    
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.top<200) {
        [self show];
    }else [self dismiss];
    
}


-(void)setSong:(BangDanDetailModel *)song{
    
    [[NSUserDefaults standardUserDefaults]setInteger:self.currentIndex forKey:@"playIndex"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    _song = song;
    
    [self.task cancel];
    
    //删除监听
    if (self.player.currentItem) {
         [self.player.currentItem removeObserver:self forKeyPath:@"status"];
    }
 //下载进度条清零
    self.progressView.progress = 0;
    
    
//    [self.task cancel];
 
    
    //请求歌曲详情
    [WebUtils requestSongInfoWithSongID:song.song_id andCompletion:^(id obj) {
        self.songDetail = obj;
       
        //根据得到的歌曲模型 控制界面显示
        self.centerView.song = self.songDetail;
        
        //毛玻璃背景图片
        [self.artworkIV setImageWithURL:self.songDetail.pic_big];
       
        
        //判断当前这首歌曲有没有下载过
        
        NSString *musicPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@.mp3",self.songDetail.title];
        
        AVPlayerItem *item = nil;
        //判断文件有没有存在
        if ([[NSFileManager defaultManager]fileExistsAtPath:musicPath]) {
          
            
            NSURL *url = [NSURL fileURLWithPath:musicPath];
            item = [AVPlayerItem playerItemWithURL:url];

            self.progressView.progress = 1;
          
            
        }else{//没有 播放网络地址
            item = [AVPlayerItem playerItemWithURL:self.songDetail.musicURL];
        
        }
        
        //监听歌曲数据下载情况
        [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        [self.player replaceCurrentItemWithPlayerItem:item];
       
 
        
        
        
        
        //下载歌曲并且播放
//        [self downloadMusicWithURL:self.songDetail.musicURL];
        
        //解析歌词************************
        self.lrcDic = [Utils parseLrcWithPath:self.songDetail.lrclink];
        //对时间进行排序
        self.keys = [self.lrcDic.allKeys sortedArrayUsingSelector:@selector(compare:)];
        [self.lrcTableView reloadData];
        //        ************************
        
        self.progressSlider.maximumValue = self.songDetail.file_duration.floatValue;
        
        
        //控制下方播放栏的显示内容
        [self.playingBottomView.artworkIV setImageWithURL:self.songDetail.pic_big];
        self.playingBottomView.titleLabel.text = self.songDetail.title;
        self.playingBottomView.authorLabel.text = self.songDetail.author;
        
        
    }];
    
    //让播放栏的按钮变成暂停状态
    self.playingBottomView.playBtn.selected = YES;
}
    
- (void)finishAction{
    
     self.currentIndex++;
    if (self.currentIndex==self.songs.count) {
        self.currentIndex = 0;
    }
    
    self.song = self.songs[self.currentIndex];
    
}
//下载并播放
-(void)downloadMusic{
    
    NSURL *musicURL = self.songDetail.musicURL;
    NSLog(@"%@",musicURL);
    
    
  
    
    self.musicData = [NSMutableData data];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    
    
    self.task = [manager dataTaskWithRequest:[NSURLRequest requestWithURL:musicURL] uploadProgress:nil downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
//        NSLog(@"%f",downloadProgress.fractionCompleted);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.progressView.progress = downloadProgress.fractionCompleted;
            });
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSLog(@"下载完成！%@",NSHomeDirectory());
        
        NSString *newPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@.mp3",self.songDetail.title];
        [self.musicData writeToFile:newPath atomically:YES];
        
        NSMutableArray *songs = [NSMutableArray arrayWithArray:[NSKeyedUnarchiver unarchiveObjectWithFile:kSongsPath]];
      
        [songs addObject:self.song];

        
        //保存
        [NSKeyedArchiver archiveRootObject:songs toFile:kSongsPath];
        
        
    }];

    
    //设置接收实时数据的协议方法
    [manager setDataTaskDidReceiveDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDataTask * _Nonnull dataTask, NSData * _Nonnull data) {
        NSLog(@"%ld",data.length);
        [self.musicData appendData:data];
    }];
//
//    NSLog(@"++++++++++++++");
   [self.task resume];
    
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    AVPlayerStatus status = [change[@"new"]integerValue];
    
    switch (status) {
        case AVPlayerStatusReadyToPlay:
            NSLog(@"准备好播放");
            [self.player play];
            self.isPlaying = YES;
            break;
        case AVPlayerStatusFailed:
            NSLog(@"加载失败");
            break;
        case AVPlayerStatusUnknown:
            NSLog(@"找不到资源");
            break;
            
        default:
            break;
    }
}

#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView.tag==0) {//歌曲列表
        return self.songs.count;
    }
    
    return self.lrcDic.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==0) {//歌曲列表
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.detailTextLabel.textColor = [UIColor lightGrayColor];
            cell.backgroundColor = [UIColor clearColor];
            //设置cell选中背景颜色
            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
            cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        }
        
        BangDanDetailModel *song = self.songs[indexPath.row];
        cell.textLabel.text = song.title;
        cell.detailTextLabel.text = song.author;
       
        if (indexPath.row==self.currentIndex) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                NSData *data = [NSData dataWithContentsOfURL:song.pic_small];
                UIImage *image = [UIImage imageWithData:data];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.imageView.image = image;
                    [cell setNeedsLayout];
                });
                
            });
            
        }else{//为了避免重用出错
            cell.imageView.image = nil;
            
        }
        
        return cell;
    }else{//显示歌词
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        NSNumber *key = self.keys[indexPath.row];
        NSString *text = self.lrcDic[key];
        cell.textLabel.text = text;
        
        
        //控制显示效果
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.shadowColor = [UIColor whiteColor];
        cell.textLabel.shadowOffset = CGSizeMake(.5, .5);
        //歌词高亮颜色
        cell.textLabel.highlightedTextColor = [UIColor yellowColor];
        //去掉选中颜色
        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.bounds];
        cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
        
        return cell;
        
    }
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag==0) {
        
        self.currentIndex = indexPath.row;
            self.song = self.songs[indexPath.row];
        [self.songListTableView reloadData];
        
 
        
        
    }else{//点击歌词
        NSString *key = self.keys[indexPath.row];
        
        
        //修改播放器的时间 需要先停止再播放
        [self.player pause];
        [self.player seekToTime:CMTimeMakeWithSeconds(key.floatValue, self.player.currentTime.timescale) completionHandler:^(BOOL finished) {
             if (finished) {
                 [self.player play];
             }
         }];
        
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==1) {
        return 25;
    }
    return 40;
}

@end
