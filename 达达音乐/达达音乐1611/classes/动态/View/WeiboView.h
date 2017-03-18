//
//  WeiboView.h
//  微博登录
//
//  Created by tarena on 16/10/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYTextView.h"
#import "PhotosView.h"
#import "MessageModel.h"
@interface WeiboView : UIView
//显示文本的控件
@property (nonatomic, strong)YYTextView *textView;

//显示图片的控件
@property (nonatomic, strong)PhotosView *pv;

//显示转发的控件
@property (nonatomic, strong)WeiboView *reWeiboView;

@property (nonatomic, strong)MessageModel *message;
@end
