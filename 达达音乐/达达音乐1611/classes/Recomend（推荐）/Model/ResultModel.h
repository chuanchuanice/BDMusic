//
//  ResultModel.h
//  达达音乐1611
//
//  Created by tarena on 2017/2/24.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "JSONModel.h"
#import "Mix_9.h"
#import "Focus.h"
#import "EetryModel.h"
#import "Mix_2Model.h"
#import "DiyModel.h"
#import "AlbumModel.h"
#import "Mix_22Model.h"
#import "Mod_27Model.h"
#import "Mix_9Model.h"
#import "Mix_5Model.h"
#import "RdioModel.h"
#import "ScenceModel.h"
#import "RecsongModel.h"
#import "Mod_7Model.h"
@interface ResultModel : JSONModel
@property (nonatomic, strong)Mix_9 *mix_9;
@property (nonatomic, strong)Focus *focus;
@property (nonatomic,strong)EetryModel *entry;
@property (nonatomic,strong)Mix_2Model<Optional> *mix_2;
@property (nonatomic,strong)DiyModel *diy;
@property (nonatomic,strong)AlbumModel *album;
@property (nonatomic,strong)Mix_22Model *mix_22;
@property (nonatomic,strong)Mod_27Model *mod_27;
@property (nonatomic,strong)Mix_5Model *mix_5;
@property (nonatomic,strong)RdioModel *radio;
@property (nonatomic,strong)ScenceModel  *scene;
@property (nonatomic,strong)RecsongModel  *recsong;
@property (nonatomic,strong)Mod_7Model *mod_7;


@end
