//
//  WebUtils.m
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "SongInfo.h"
#import "SongModel.h"
#import "BangDanDetailModel.h"
#import "MessageModel.h"
#import "RootModel.h"
#import "AdModel.h"
#import "KTVSongModel.h"
 #import "BangDanModel.h"
#import "SongListItemModel.h"
 #import "WebUtils.h"
#define kRecommentPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.plaza.index&from=ios&version=5.8.3&cuid=9bf9dd79422f0daff3b71760c8b3ff4711d6c9fb&channel=appstore&operator=0"
#define kSongslistPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.gedan&page_no=1&page_size=30&from=ios&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kHotCategoryPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billCategory&format=json&from=ios&kflag=2&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kSongInfoPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.getInfos&ts=1475164135&songid=%@&nw=2&l2p=395.1&lpb=320000&ext=MP3&format=json&from=ios&usup=1&lebo=0&aac=0&ucf=4&vid=&res=1&e=FuQ105WnGRfnAYDe2H%%2FYvCkKi8tA3QhyC6fmlIiYJHY%%3D&channel=24fc6b080e10ed8522fbb16da65619eafdf1db28&cuid=appstore&from=ios&version=5.9.0"
#define kKTVImageURLPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.active.showList&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
#define kKTVSongsPath @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.learn.now&from=ios&from=ios&version=5.8.3&cuid=511e7b5ebe3cb83b66008608b586c12220e6b5aa&channel=appstore&operator=0"
@implementation WebUtils


+(void)requestSongListDataWithCompletion:(MyCallback)callback
{
    
 
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager GET:kSongslistPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSArray *contentArr = dic[@"content"];
        
        NSArray *songListItemModelArr = [SongListItemModel arrayOfModelsFromDictionaries:contentArr error:nil];
        
        callback(songListItemModelArr);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取歌单列表信息失败%@",error);
        
    }];
    
    
    
    
}

+(void)requestHotCategoryDataWithCompletion:(MyCallback)callback
{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager GET:kHotCategoryPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSArray *contentArr = dic[@"content"];
        
        NSArray *bangdanModelArr = [BangDanModel arrayOfModelsFromDictionaries:contentArr error:nil];
        
        callback(bangdanModelArr);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取推荐列表信息失败%@",error);
        
    }];
    
}

+(void)requestKTVImageURLWithCompletion:(MyCallback)calllback{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
  
    
    [manager GET:kKTVImageURLPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        
        NSArray *adModels = [AdModel arrayOfModelsFromDictionaries:dic[@"result"] error:nil];
        
        calllback(adModels);
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取推荐列表信息失败%@",error);
        
    }];
    
}
+(void)requestKTVSongsWithCompletion:(MyCallback)calllback{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    [manager GET:kKTVSongsPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        
        NSArray *arr = dic[@"result"][@"items"];
        NSArray *songs = [KTVSongModel arrayOfModelsFromDictionaries:arr error:nil];
        
        
        calllback(songs);
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取推荐列表信息失败%@",error);
        
    }];
    
}


+(void)requestRecomentedWithCompletion:(MyCallback)calllback{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    [manager GET:kRecommentPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        RootModel *rm = [[RootModel alloc]initWithDictionary:dic error:nil];
       
        
        
        calllback(rm);
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取推荐列表信息失败%@",error);
        
    }];
    
}

+(void)requestMessageWithCompletion:(MyCallback)calllback{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    
    
    
    [manager GET:@"http://tingapi.ting.baidu.com/v1/restserver/ting?from=android&version=5.9.0.0&channel=1426d&operator=0&method=baidu.ting.ugcfriend.getList&format=json&param=eluR8EsKpyGTqHM6q1LnQ9OVUxv4myeNzjG4puPHWPRrAGhRkLiOOK79C5PaSCRKwPgOp%2B0Fd4438lJwCX5eQw%3D%3D&timestamp=1477726726&sign=de154562a9371b8fa49e925233fc5f12" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        
        NSArray *msgArr = dic[@"msg"];
        
        NSMutableArray *messages = [NSMutableArray array];
        
        for (NSDictionary *msgDic in msgArr) {
            //找出不一样的类型 跳过
            if ([msgDic[@"msgtype"]integerValue] ==2) {
                continue;
            }
            
            MessageModel *m = [[MessageModel alloc]initWithDictionary:msgDic error:nil];
            [messages addObject:m];
        }
        //此处解析并返回数据
        
        calllback(messages);
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取推荐列表信息失败%@",error);
        
    }];
    
}



+(void)requestBangDanDetailWithType:(NSInteger)type andCompletion:(MyCallback)callback
{
    NSMutableDictionary *mainDic = [NSMutableDictionary dictionary];
    
    NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billList&type=%ld&format=json&offset=0&size=100&from=ios&fields=title,song_id,author,resource_type,havehigh,is_new,has_mv_mobile,album_title,ting_uid,album_id,charge,all_rate,mv_provider&from=ios&version=5.8.3&cuid=24fc6b080e10ed8522fbb16da65619eafdf1db28&channel=appstore&operator=0",type];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSArray *song_listArr = dic[@"song_list"];
        
        
        //解析出封面和更新时间
        NSString *pic = dic[@"billboard"][@"pic_s640"];
        NSString *date = dic[@"billboard"][@"update_date"];
        
        NSMutableDictionary *headerDic = [NSMutableDictionary dictionary];
        if (pic) {
            [headerDic setObject:pic forKey:@"pic"];
        }
        if (date) {
            [headerDic setObject:date forKey:@"date"];
        }
        
        NSArray *bangdanModelArr = [BangDanDetailModel arrayOfModelsFromDictionaries:song_listArr error:nil];
        
        if (song_listArr && headerDic) {
            
            [mainDic setObject:headerDic forKey:@"headerDic"];
            
            [mainDic setObject:bangdanModelArr forKey:@"bangdanModelArr"];
        }
        
        callback(mainDic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取推荐列表信息失败%@",error);
        
    }];
    
    
    
}

+(void)requestSongInfoWithSongID:(NSString *)songID andCompletion:(MyCallback)callback{
    
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.getInfos&ts=1475164135&songid=%@&nw=2&l2p=395.1&lpb=320000&ext=MP3&format=json&from=ios&usup=1&lebo=0&aac=0&ucf=4&vid=&res=1&e=FuQ105WnGRfnAYDe2H%%2FYvCkKi8tA3QhyC6fmlIiYJHY%%3D&channel=24fc6b080e10ed8522fbb16da65619eafdf1db28&cuid=appstore&from=ios&version=2.2.0",songID];
    
    [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        
        SongModel *song  = [[SongModel alloc]initWithDictionary:dic[@"songinfo"] error:nil];
        
        //手动解析下载地址
        NSString *musicPath = dic[@"songurl"][@"url"][0][@"show_link"];
        
        song.musicURL = [NSURL URLWithString:musicPath];
        
        callback(song);
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"获取推荐列表信息失败%@",error);
        
    }];
    
    
    
    
}
    
    +(void)searchInfoWithString:(NSString *)string andCompletion:(MyCallback)callback{
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
        NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.search.catalogSug&format=json&query=%@",string];
        path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            
            
            NSArray *songs = [SongInfo arrayOfModelsFromDictionaries:dic[@"song"] error:nil];
            
          
            
            callback(songs);
            
            
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"获取推荐列表信息失败%@",error);
            
        }];
        
        
    }
    
    +(void)searchSongsWithSongName:(NSString *)name andCompletion:(MyCallback)callback{
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
        NSString *path = [NSString stringWithFormat:@"http://tingapi.ting.baidu.com/v1/restserver/ting?from=qianqian&version=2.1.0&method=baidu.ting.search.common&format=json&query=%@&page_no=1&page_size=30",name];
        path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            
            
            NSArray *songs = [BangDanDetailModel arrayOfModelsFromDictionaries:dic[@"song_list"] error:nil];
            
            
            
            callback(songs);
            
            
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSLog(@"获取推荐列表信息失败%@",error);
            
        }];
        
        
    }

@end
