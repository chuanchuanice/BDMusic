//
//  CenterView.h
//  百度音乐
//
//  Created by tarena on 16/11/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongModel.h"
@interface CenterView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *artworkIV;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong)SongModel *song;
- (IBAction)downloadAction:(id)sender;

@end
