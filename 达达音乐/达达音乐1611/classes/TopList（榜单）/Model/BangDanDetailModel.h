//
//  BangDanXiangXiModel.h
//  百度音乐
//
//  Created by tarena on 2016/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface BangDanDetailModel : JSONModel<NSCoding>
@property (nonatomic,copy)NSString<Optional> *title;
@property (nonatomic,copy)NSString<Optional> *author;
@property (nonatomic,strong)NSURL<Optional> *pic_small;
@property (nonatomic,strong)NSURL<Optional> *lrclink;
@property (nonatomic,copy)NSString<Optional> *has_mv;

@property (nonatomic,copy)NSString<Optional> *song_id;
@property (nonatomic,copy)NSString<Optional> *resource_type_ext;
@property (nonatomic,copy)NSString<Optional> *rank;
@end
