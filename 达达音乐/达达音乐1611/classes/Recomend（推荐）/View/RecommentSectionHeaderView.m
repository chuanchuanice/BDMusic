//
//  RecommentSectionHeaderView.m
//  百度音乐
//
//  Created by tarena on 16/10/27.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "RecommentSectionHeaderView.h"

@implementation RecommentSectionHeaderView

-(void)setModule:(SubModel *)module{
    _module = module;
    
    self.titleLabel.text = module.title;
    [self.moreBtn setTitle:module.title_more forState:UIControlStateNormal];
    
    [self.iconIV setImageWithURL:module.picurl];
    
    
}

@end
