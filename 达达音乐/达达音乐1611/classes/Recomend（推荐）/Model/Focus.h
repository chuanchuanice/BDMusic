//
//  Focus.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/24.
//  Copyright © 2017年 tarena. All rights reserved.
//
@protocol FocusResultModel <NSObject>
@end
#import "JSONModel.h"
#import "FocusResultModel.h"
@interface Focus : JSONModel
@property (nonatomic, strong)NSArray<FocusResultModel> *result;
@end
