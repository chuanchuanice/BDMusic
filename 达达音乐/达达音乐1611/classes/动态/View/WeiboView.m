//
//  WeiboView.m
//  微博登录
//
//  Created by tarena on 16/10/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WeiboView.h"

@implementation WeiboView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
 
        
        //创建显示文本的控件
        self.textView = [[YYTextView alloc]initWithFrame:CGRectMake(8, 0, frame.size.width-16, 0)];
        [self addSubview:self.textView];
        self.textView.userInteractionEnabled = NO;
        self.textView.editable = NO;
        
        //创建显示图片的控件
        self.pv = [[PhotosView alloc]initWithFrame:CGRectMake(8, 0, frame.size.width-16, 0)];
        [self addSubview:self.pv];
        
         
    }
    return self;
}

-(void)setMessage:(MessageModel *)message{
    _message = message;
    //控制文本控件显示 及更新大小
    self.textView.text = message.msg;
    CGRect frame = self.textView.frame;
    frame.size.height = [message textHeight];
    self.textView.frame = frame;

    
    //设置自定义图片控件的高度
    CGRect pvFrame = self.pv.frame;
    pvFrame.origin.y = CGRectGetMaxY(self.textView.frame)+5;
    pvFrame.size.height = [message imageHeight];

    self.pv.frame = pvFrame;
    
    //控制图片显示
    self.pv.pic_urls = message.piclist;
    

    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
