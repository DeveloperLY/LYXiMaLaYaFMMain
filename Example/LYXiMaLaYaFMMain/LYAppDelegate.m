//
//  LYAppDelegate.m
//  LYXiMaLaYaFMMain
//
//  Created by DeveloperLY on 04/25/2017.
//  Copyright (c) 2017 DeveloperLY. All rights reserved.
//

#import "LYAppDelegate.h"
#import <LYXiMaLaYaFMMain/LYTabBarController.h>
#import <LYXiMaLaYaFMMain/LYTabBar.h>
#import "LYTestViewController.h"

@implementation LYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    LYTabBarController *rootController = [LYTabBarController tabBarControllerWithAddChildVCsBlock:^(LYTabBarController *tabBarController) {
        [tabBarController addChildViewController:[LYTestViewController new] normalImageName:@"tabbar_find_n" selectedImageName:@"tabbar_find_h" isRequiredNavController:YES];
        [tabBarController addChildViewController:[UIViewController new] normalImageName:@"tabbar_sound_n" selectedImageName:@"tabbar_sound_h" isRequiredNavController:YES];
        [tabBarController addChildViewController:[UIViewController new] normalImageName:@"tabbar_download_n" selectedImageName:@"tabbar_download_h" isRequiredNavController:YES];
        [tabBarController addChildViewController:[UIViewController new] normalImageName:@"tabbar_me_n" selectedImageName:@"tabbar_me_h" isRequiredNavController:YES];
    }];
    
    LYTabBar *tabBar = (LYTabBar *)rootController.tabBar;
    tabBar.playButtonDidClickBlock = ^(BOOL isPlaying) {
        if (isPlaying) {
            NSLog(@"正在播放中...");
        } else {
            NSLog(@"停止播放状态");
        }
    };
    
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
