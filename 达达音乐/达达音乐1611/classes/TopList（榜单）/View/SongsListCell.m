//
//  BangDanXiangXiCell.m
//  百度音乐
//
//  Created by tarena on 2016/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "SongsListCell.h"
#import "ViewUtils.h"

@implementation SongsListCell

-(void)setBdm:(BangDanDetailModel *)bdm
{
    _bdm = bdm;
    
    self.MVIV.hidden = self.SQIV.hidden = NO;
    
    self.MVIV.origin = CGPointMake(46, 25);
    
    self.author.origin = CGPointMake(70, 25);
    
    self.titleLabel.text = bdm.title;
    
    self.author.text = bdm.author;
    
    //排名
    int number = bdm.rank.intValue;
    switch (number) {
        case 1:
            self.numLabel.textColor = [UIColor redColor];
            break;
        case 2:
            self.numLabel.textColor = [UIColor orangeColor];
            break;
        case 3:
            self.numLabel.textColor = [UIColor yellowColor];
            break;
            
        default:
            self.numLabel.textColor = [UIColor blackColor];
            break;
    }
    self.numLabel.text = [NSString stringWithFormat:@"%02d", number];
    
    if ([bdm.resource_type_ext isEqualToString:@"1"] && [bdm.has_mv isEqualToString:@"0"])
    {
        self.MVIV.hidden = YES;
        self.author.left = 46;
    }
    
    if ([bdm.resource_type_ext isEqualToString:@"0"] && [bdm.has_mv isEqualToString:@"1"])
    {
        self.SQIV.hidden = YES;
        
        self.MVIV.left = 27;
        
        self.author.left = 46;
    }
    
    if ([bdm.resource_type_ext isEqualToString:@"0"] && [bdm.has_mv isEqualToString:@"0"])
    {
        self.SQIV.hidden = self.MVIV.hidden = YES;
        
        self.author.left = 27;
    }
}

- (void)awakeFromNib {
   
    
    
}


@end
