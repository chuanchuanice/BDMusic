//
//  Mix_9.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/24.
//  Copyright © 2017年 tarena. All rights reserved.
//
@protocol Mix_9ResultModel <NSObject>
@end
#import "JSONModel.h"
#import "Mix_9ResultModel.h"
@interface Mix_9 : JSONModel
@property (nonatomic, strong)NSArray<Mix_9ResultModel> *result;
@end
