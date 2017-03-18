//
//  EetryModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/25.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Entry_RSModel.h"
@protocol Entry_RSModel <NSObject>
@end

@interface EetryModel : JSONModel
@property (nonatomic,strong)NSArray <Entry_RSModel> *result;
@end
