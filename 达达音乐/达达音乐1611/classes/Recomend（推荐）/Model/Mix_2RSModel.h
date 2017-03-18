//
//  Mix_2RSModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/25.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface Mix_2RSModel : JSONModel
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,strong)NSURL  *pic;
@property(nonatomic,copy)NSString *title;
@end
