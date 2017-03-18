//
//  Album_RSModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/25.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface Album_RSModel : JSONModel
@property(nonatomic,strong)NSURL  *pic;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *author;
@end
