//
//  MessageModel.h
//  百度音乐
//
//  Created by tarena on 16/11/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Author.h"
#import "MessageContent.h"
@interface MessageModel : JSONModel
@property (nonatomic, strong)Author *author;
@property (nonatomic, copy)NSString *ctime;
@property (nonatomic, copy)NSString *msg;
@property (nonatomic, copy)NSString *comment_num;
@property (nonatomic, copy)NSString *share_num;
@property (nonatomic, copy)NSString *zan_num;
@property (nonatomic, strong)NSArray<Optional> *piclist;
@property (nonatomic, strong)MessageContent *content;

-(float )messageHeight;
-(float)textHeight;
-(float)imageHeight;
@end
