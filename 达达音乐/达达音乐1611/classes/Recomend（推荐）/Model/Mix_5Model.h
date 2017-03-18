//
//  Mix_5Model.h
//  达达音乐1611
//
//  Created by 刘梓轩 on 2017/2/26.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Mix_5RSModel.h"

@protocol Mix_5RSModel <NSObject>

@end

@interface Mix_5Model : JSONModel
@property (nonatomic,strong)NSArray<Mix_5RSModel> *result;
@end
