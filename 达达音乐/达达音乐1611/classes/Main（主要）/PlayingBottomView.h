//
//  PlayingBottomView.h
//  达达音乐
//
//  Created by tarena on 16/12/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PlayingBottomView : UIView

@property (weak, nonatomic) IBOutlet UIButton *playBtn;



@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *artworkIV;
- (IBAction)tapAction:(id)sender;
- (IBAction)nextAction:(id)sender;
- (IBAction)playBtnAction:(id)sender;

@end
