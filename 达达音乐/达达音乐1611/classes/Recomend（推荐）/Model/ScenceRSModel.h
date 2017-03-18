//
//  ScenceRSModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "ScenceRS_ActModel.h"
@protocol ScenceRS_ActModel <NSObject>

@end

@interface ScenceRSModel : JSONModel
@property (nonatomic,strong)NSArray<ScenceRS_ActModel> *action;
@end
