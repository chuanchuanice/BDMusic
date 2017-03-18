//
//  SubModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/24.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface SubModel : JSONModel
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *key;
@property (nonatomic, copy)NSString *pos;


@property (nonatomic, copy)NSString *title_more;
@property (nonatomic, strong)NSURL *picurl;

@end
