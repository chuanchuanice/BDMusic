//
//  HotDetailHeaderView.h
//  百度音乐
//
//  Created by tarena on 16/10/29.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotDetailHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong)NSDictionary *headerDic;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (void)updateSubViewsWithOffsetY:(float )offsetY;
@end
