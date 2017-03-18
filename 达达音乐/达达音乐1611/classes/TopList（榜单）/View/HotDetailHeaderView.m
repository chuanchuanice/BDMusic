//
//  HotDetailHeaderView.m
//  百度音乐
//
//  Created by tarena on 16/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "HotDetailHeaderView.h"

@implementation HotDetailHeaderView

-(void)setHeaderDic:(NSDictionary *)headerDic{
    _headerDic = headerDic;
    [self.imageView setImageWithURL:[NSURL URLWithString:headerDic[@"pic"]]];
    self.dateLabel.text = [NSString stringWithFormat:@"更新日期:%@",headerDic[@"date"]];
    
}
-(void)updateSubViewsWithOffsetY:(float)offsetY{
//    self.bgView.height = 200+(-offsetY);
    
   
    
    
    if (offsetY<0&&offsetY>-(kSW-200)) {
       NSLog(@"%f",offsetY);
        self.imageView.transform = CGAffineTransformMakeTranslation(0, offsetY);
        
        
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
