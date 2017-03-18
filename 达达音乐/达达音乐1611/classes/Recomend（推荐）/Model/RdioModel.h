//
//  RdioModel.h
//  达达音乐1611
//
//  Created by 刘梓轩 on 2017/2/26.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "RdioRSModel.h"

@protocol RdioRSModel<NSObject>
@end
@interface RdioModel : JSONModel
@property (nonatomic,strong)NSArray<RdioRSModel> *result;
@end
