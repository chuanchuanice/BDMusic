//
//  SongInfo.h
//  达达音乐1611
//
//  Created by tarena on 2017/3/2.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface SongInfo : JSONModel
    @property (nonatomic, copy)NSString *songname;
    @property (nonatomic, copy)NSString *artistname;
@end
