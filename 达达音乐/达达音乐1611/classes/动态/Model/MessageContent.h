//
//  MessageContent.h
//  百度音乐
//
//  Created by tarena on 16/11/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"

@interface MessageContent : JSONModel
@property (nonatomic, copy)NSString *content_id;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString<Optional> *artist_name;
@property (nonatomic, strong)NSURL *pic;
@end
