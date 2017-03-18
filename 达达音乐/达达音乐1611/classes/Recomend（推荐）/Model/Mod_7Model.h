//
//  Mod_7Model.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Mod_7RSModel.h"
@protocol Mod_7RSModel<NSObject>
@end

@interface Mod_7Model : JSONModel
@property (nonatomic,strong)NSArray<Mod_7RSModel> *result;
@end
