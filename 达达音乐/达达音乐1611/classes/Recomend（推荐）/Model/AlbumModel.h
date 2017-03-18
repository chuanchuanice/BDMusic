//
//  AlbumModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/25.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Album_RSModel.h"

@protocol  Album_RSModel <NSObject>
@end

@interface AlbumModel : JSONModel
@property (nonatomic,strong)NSArray <Album_RSModel> *result;
@end
