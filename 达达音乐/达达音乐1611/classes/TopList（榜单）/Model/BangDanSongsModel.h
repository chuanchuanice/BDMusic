//
//  BangDanSongsModel.h
//  百度音乐
//
//  Created by tarena on 2016/10/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface BangDanSongsModel : JSONModel
@property (nonatomic,copy)NSString<Optional> *title;
@property (nonatomic,copy)NSString<Optional> *author;
@property (nonatomic,copy)NSString<Optional> *song_id;
@property (nonatomic,copy)NSString<Optional> *album_id;
@property (nonatomic,copy)NSString<Optional> *album_title;
@end
