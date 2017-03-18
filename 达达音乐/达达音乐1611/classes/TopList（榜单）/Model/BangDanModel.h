//
//  BangDanModel.h
//  百度音乐
//
//  Created by tarena on 2016/10/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "BangDanSongsModel.h"

@protocol BangDanSongsModel  <NSObject>
@end

@interface BangDanModel : JSONModel
@property (nonatomic, copy)NSString<Optional> *name;
@property (nonatomic,copy)NSString<Optional> *comment;
@property (nonatomic,strong)NSURL<Optional> *pic_s192;
@property (nonatomic)NSInteger type;
@property (nonatomic,strong) NSArray<BangDanSongsModel> *content;

@end
