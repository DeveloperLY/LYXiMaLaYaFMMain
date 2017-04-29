//
//  LYMainModuleAPI.m
//  LYXiMaLaYaFMMain
//
//  Created by LiuY on 2017/4/29.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYMainModuleAPI.h"
#import "LYTabBarController.h"
#import "LYTabBar.h"
#import "LYNavigationBar.h"
#import "LYMiddlePlayView.h"

@implementation LYMainModuleAPI

+ (LYTabBarController *)rootTabBarCcontroller {
    return [LYTabBarController shareInstance];
}

+ (void)addChildViewController:(UIViewController *)viewController normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired {
    [[LYTabBarController shareInstance] addChildViewController:viewController normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];
}

+ (void)setTabbarMiddleButtonDidClick:(void (^)(BOOL))middleDidClickBlock {
    LYTabBar *tabBar = (LYTabBar *)[LYTabBarController shareInstance].tabBar;
    tabBar.playButtonDidClickBlock = middleDidClickBlock;
}

+ (void)setNavBarGlobalBackGroundImage:(UIImage *)globalImage {
    [LYNavigationBar setGlobalBackGroundImage:globalImage];
}

+ (void)setNavBarGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize {
    [LYNavigationBar setGlobalTextColor:globalTextColor andFontSize:fontSize];
}

+ (LYMiddlePlayView *)middlePlayView {
    return [LYMiddlePlayView middlePlayView];
}

@end
