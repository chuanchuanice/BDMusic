//
//  AppDelegate.m
//  达达音乐1611
//
//  Created by tarena on 2017/2/23.
//  Copyright © 2017年 tarena. All rights reserved.
//
#import "PlayingView.h"
#import "ViewUtils.h"
#import "AppDelegate.h"
#import "WMPageController.h"
#import "MineViewController.h"
#import "DynamicTableViewController.h"
#import "PlayingBottomView.h"
#import "MusicPageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    WMPageController *pageController = [[WMPageController alloc]initWithViewControllerClasses:@[[MineViewController class],[MusicPageController class],[DynamicTableViewController class]] andTheirTitles:@[@"我的",@"音乐",@"动态"]];
    pageController.menuHeight = 44;
    pageController.menuViewStyle = WMMenuViewStyleLine;
    pageController.titleSizeSelected = 15;
    pageController.showOnNavigationBar = YES;
    pageController.menuBGColor = [UIColor clearColor];
    pageController.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
    
    
    
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:pageController];
    [self.window makeKeyAndVisible];
    
    PlayingBottomView *pbv = [[NSBundle mainBundle]loadNibNamed:@"PlayingBottomView" owner:self options:nil].firstObject;
    pbv.top = kSH-pbv.height;
    [self.window addSubview:pbv];
    PlayingView *pv = [PlayingView shareView];
    pv.top = kSH;
    pv.playingBottomView = pbv;
     [self.window addSubview:pv];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    //后台播放，设置会话类型。
    AVAudioSession *session = [AVAudioSession sharedInstance];
    //类型是:播放和录音。
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    //而且要激活，音频会话。
    [session setActive:YES error:nil];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
