//
//  Utils.m
//  音乐播放器
//
//  Created by tarena on 16/4/19.
//  Copyright © 2016年 tarena. All rights reserved.
//


#import <AVFoundation/AVFoundation.h>
#import "Utils.h"

@implementation Utils


+(NSDictionary *)parseLrcWithPath:(NSURL *)url{
    //得到完整的歌词字符串
    NSString *lrcString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    
    //得到每一行
    NSArray *lines = [lrcString componentsSeparatedByString:@"\n"];
    NSMutableDictionary *lrcDic = [NSMutableDictionary dictionary];
    //遍历每一行
    for (NSString *line in lines) {
        if (![line containsString:@"]"]) {
            continue;
        }
        //分割出时间和歌词
        NSArray *timeAndText = [line componentsSeparatedByString:@"]"];
        //取出歌词内容
        NSString *text = [timeAndText lastObject];
        //取出时间字符串
        NSString *timeString = [[timeAndText firstObject] substringFromIndex:1];
        //分割出分和秒
        NSArray *timeArr = [timeString componentsSeparatedByString:@":"];
        //得到秒数
        float time = [timeArr[0] intValue]*60+[timeArr[1] floatValue];
        
        //把歌词和时间的对应关系存到字典中
        [lrcDic setObject:text forKey:@(time)];
        
    }
    //把得到的歌词相关字典返回
    return lrcDic;
    
    
}
@end
