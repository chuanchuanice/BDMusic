//
//  Mod_27Model.h
//  达达音乐1611
//
//  Created by 刘梓轩 on 2017/2/26.
//  Copyright © 2017年 tarena. All rights reserved.
//


#import "JSONModel.h"
#import "Mod_27RSModel.h"
@protocol Mod_27RSModel <NSObject>

@end

@interface Mod_27Model : JSONModel
@property (nonatomic,strong)NSArray<Mod_27RSModel> *result;
@end
