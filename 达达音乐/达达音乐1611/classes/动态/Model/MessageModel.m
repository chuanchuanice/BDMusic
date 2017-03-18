//
//  MessageModel.m
//  百度音乐
//
//  Created by tarena on 16/11/3.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MessageModel.h"
#import "YYTextView.h"
@implementation MessageModel

-(NSString *)ctime{
    
    
    //得到距1970年秒数
    long weiboTime = _ctime.floatValue;
    //    得到当前时间距1970年秒数
    long nowTime = [[NSDate new] timeIntervalSince1970];
    long time = nowTime - weiboTime;
    //判断是否在1分钟内
    if (time<=60) {
        return @"刚刚";
    }else if (time>60&&time<=3600) {
        return [NSString stringWithFormat:@"%ld分钟前",time/60];
    }else if (time>3600&&time<=3600*24) {//判断一天内
        return [NSString stringWithFormat:@"%ld小时前",time/3600];
    }else{
        NSDateFormatter *formatter = [NSDateFormatter new];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:weiboTime];
        //        显示具体日期
        formatter.dateFormat = @"MM-dd";
        return [formatter stringFromDate:date];
    }

    
    
}
-(float)messageHeight{
        float height = 0;
        //得到文本的高度
        height += [self textHeight];
        
        //判断是否有图片
        if (self.piclist.count>0) {
            height += [self imageHeight]+5;
        }
    return height;
    
}

-(float)textHeight{
    
    YYTextView *tv = [[YYTextView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-2*8, 0)];
    
    tv.text = self.msg;
    
    //得到文本高度
    return tv.textLayout.textBoundingSize.height;
}

-(float)imageHeight{
    //宫格式图片的大小
    float size = ([UIScreen mainScreen].bounds.size.width-2*8-10)/3;
    if (self.piclist.count==1) {
        return 2*size;
    }else if (self.piclist.count>1&&self.piclist.count<=3){
        return size;
    }else if (self.piclist.count>3&&self.piclist.count<=6){
        return 2*size+5;
    }else if (self.piclist.count>6&&self.piclist.count<=9){
        return 3*size+2*5;
    }
    
    
    return 0;
}

@end
