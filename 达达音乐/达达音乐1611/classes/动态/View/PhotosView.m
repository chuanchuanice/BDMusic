//
//  PhotosView.m
//  微博登录
//
//  Created by tarena on 16/10/21.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "PhotosView.h"

@implementation PhotosView


-(void)setPic_urls:(NSArray *)pic_urls{
    
    _pic_urls = pic_urls;
    
    //清空
    for (UIImageView *iv in self.subviews) {
        [iv removeFromSuperview];
    }
    
    
    float size = ([UIScreen mainScreen].bounds.size.width-2*8-10)/3;

    
    if (pic_urls.count==1) {
        
        NSDictionary *imgDic = pic_urls[0];
        
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 2*size, 2*size)];
        
        [iv setImageWithURL:[NSURL URLWithString:imgDic[@"thumbnail"]]];
        [self addSubview:iv];
        iv.contentMode = UIViewContentModeScaleAspectFill;
        //超出内容不显示
        iv.clipsToBounds = YES;
        
        
    }else{//多张
        for (int i=0; i<pic_urls.count; i++) {
            UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(i%3*(size+5), i/3*(size+5), size, size)];
            NSDictionary *imgDic = pic_urls[i];
            [iv setImageWithURL:[NSURL URLWithString:imgDic[@"thumbnail"]]];
            iv.contentMode = UIViewContentModeScaleAspectFill;
            //超出内容不显示
            iv.clipsToBounds = YES;
            [self addSubview:iv];
        }
    }
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
