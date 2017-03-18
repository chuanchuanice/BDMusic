//
//  KTVSongModel.h
//  百度音乐
//
//  Created by tarena on 16/11/2.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface KTVSongModel : JSONModel
@property (nonatomic, copy) NSString *song_id;
@property (nonatomic, copy) NSString *song_title;


@property (nonatomic, copy) NSString *artist_name;

@property (nonatomic, copy) NSString *play_num;


@property (nonatomic, strong) NSURL *picture_300_300;


@end
