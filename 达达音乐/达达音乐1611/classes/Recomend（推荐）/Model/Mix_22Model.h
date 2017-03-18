//
//  Mix_22Model.h
//  达达音乐1611
//
//  Created by 刘梓轩 on 2017/2/26.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Mix_22RSModel.h"

@protocol Mix_22RSModel <NSObject>

@end

@interface Mix_22Model : JSONModel
@property (nonatomic,strong)NSArray<Mix_22RSModel> *result;
@end
