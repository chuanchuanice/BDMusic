//
//  RecsongModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Recsong_RSModel.h"
@protocol Recsong_RSModel<NSObject>
@end

@interface RecsongModel : JSONModel
@property (nonatomic,strong)NSArray<Recsong_RSModel> *result;
@end
