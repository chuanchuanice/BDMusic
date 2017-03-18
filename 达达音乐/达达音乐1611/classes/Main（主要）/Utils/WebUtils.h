//
//  WebUtils.h
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//
typedef void (^MyCallback)(id obj);
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface WebUtils : NSObject


// 请求歌单数据
+ (void)requestSongListDataWithCompletion:(MyCallback)callback;
//请求榜单数据
+(void)requestHotCategoryDataWithCompletion:(MyCallback)callback;

//请求ktv页面顶部广告
+(void)requestKTVImageURLWithCompletion:(MyCallback)calllback;
//请求ktv大家都在唱
+(void)requestKTVSongsWithCompletion:(MyCallback)calllback;

+ (void)requestRecomentedWithCompletion:(MyCallback)calllback;

+ (void)requestMessageWithCompletion:(MyCallback) callback;

//榜单详情
+(void)requestBangDanDetailWithType:(NSInteger)type andCompletion:(MyCallback)callback;

//根据歌曲id获取歌曲详情
+(void)requestSongInfoWithSongID:(NSString *)songID andCompletion:(MyCallback)callback;
    +(void)searchInfoWithString:(NSString *)string andCompletion:(MyCallback)callback;
    
    +(void)searchSongsWithSongName:(NSString *)name andCompletion:(MyCallback)callback;
@end
