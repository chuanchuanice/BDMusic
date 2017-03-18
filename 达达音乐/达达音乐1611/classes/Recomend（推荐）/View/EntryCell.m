//
//  EntryCell.m
//  达达音乐1611
//
//  Created by tarena on 2017/2/27.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "EntryCell.h"
#import "UIButton+AFNetworking.h"
@implementation EntryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setEntry:(Entry_RSModel *)entry{
    _entry = entry;
    [self.imageBtn setImageForState:UIControlStateNormal withURL:entry.icon];
    self.titleLabel.text = entry.title;
    
    
    
}

-(void)setScence:(ScenceRS_ActModel *)scence{
    _scence = scence;
    [self.imageBtn setImageForState:UIControlStateNormal withURL:scence.icon_ios];
     self.titleLabel.text = scence.scene_name;
 }
@end
