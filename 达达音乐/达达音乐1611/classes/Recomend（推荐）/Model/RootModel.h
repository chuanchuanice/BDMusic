//
//  RootModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/24.
//  Copyright © 2017年 tarena. All rights reserved.
//
@protocol SubModel <NSObject>
@end
#import "ResultModel.h"
#import "JSONModel.h"
#import "SubModel.h"
@interface RootModel : JSONModel
@property (nonatomic, strong)NSArray<SubModel> *module;
@property (nonatomic, strong)ResultModel *result;
@end
