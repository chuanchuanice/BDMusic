//
//  BangDanXiangXiModel.m
//  百度音乐
//
//  Created by tarena on 2016/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BangDanDetailModel.h"

@implementation BangDanDetailModel
    
    -(void)setTitle:(NSString<Optional> *)title{
        _title = title;
        if ([title containsString:@"<em>"]) {
            _title = [[_title stringByReplacingOccurrencesOfString:@"<em>" withString:@""] stringByReplacingOccurrencesOfString:@"</em>" withString:@""];
        }
    }
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.title forKey:@"title"];
     [aCoder encodeObject:self.author forKey:@"author"];
     [aCoder encodeObject:self.pic_small forKey:@"pic_small"];
     [aCoder encodeObject:self.lrclink forKey:@"lrclink"];
     [aCoder encodeObject:self.has_mv forKey:@"has_mv"];
     [aCoder encodeObject:self.song_id forKey:@"song_id"];
     [aCoder encodeObject:self.resource_type_ext forKey:@"resource_type_ext"];
     [aCoder encodeObject:self.rank forKey:@"rank"];
    
    
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.author = [aDecoder decodeObjectForKey:@"author"];
        self.pic_small = [aDecoder decodeObjectForKey:@"pic_small"];
        self.lrclink = [aDecoder decodeObjectForKey:@"lrclink"];
        self.has_mv = [aDecoder decodeObjectForKey:@"has_mv"];
        self.song_id = [aDecoder decodeObjectForKey:@"song_id"];
        self.resource_type_ext = [aDecoder decodeObjectForKey:@"resource_type_ext"];
        self.rank = [aDecoder decodeObjectForKey:@"rank"];
  
    }
    return self;
}
@end
