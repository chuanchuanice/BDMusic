//
//  Recsong_RSModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface Recsong_RSModel : JSONModel
@property(nonatomic,strong)NSURL  *pic_premium;
@property(nonatomic,strong)NSString  *title;
@property(nonatomic,strong)NSString  *author;
@end
