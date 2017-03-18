//
//  Author.h
//  百度音乐
//
//  Created by tarena on 16/11/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface Author : JSONModel
@property (nonatomic, copy)NSString *username;
@property (nonatomic, strong)NSURL *userpic_small;

@end
