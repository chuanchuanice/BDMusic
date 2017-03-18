//
//  DiyModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/25.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Diy_RSModel.h"

@protocol  Diy_RSModel <NSObject>
@end

@interface DiyModel : JSONModel
@property (nonatomic,strong)NSArray <Diy_RSModel> *result;
@end



