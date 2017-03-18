//
//  Mix_9Model.h
//  达达音乐1611
//
//  Created by 刘梓轩 on 2017/2/26.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Mix_9RSModel.h"
@protocol Mix_9RSModel <NSObject>

@end

@interface Mix_9Model : JSONModel
@property (nonatomic,strong)NSArray<Mix_9RSModel> *result;
@end
