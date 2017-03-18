//
//  SongListItemModel.h
//  百度音乐
//
//  Created by tarena on 2016/10/28.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface SongListItemModel : JSONModel
@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)NSURL *pic_300;
@end
