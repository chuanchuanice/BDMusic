//
//  Mix_2Model.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/25.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Mix_2RSModel.h"
@protocol Mix_2RSModel <NSObject>
@end

@interface Mix_2Model : JSONModel
@property (nonatomic,strong)NSArray <Mix_2RSModel> *result;
@end
