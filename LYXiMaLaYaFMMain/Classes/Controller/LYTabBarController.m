//
//  LYTabBarController.m
//  LYXiMaLaYaFMMain
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYNavigationController.h"
#import "LYTabBar.h"
#import <LYXiMaLaYaFMBase/UIImage+LYAdd.h>
#import "LYMiddlePlayView.h"

@interface LYTabBarController ()

@end

@implementation LYTabBarController

+ (instancetype)shareInstance {
    static LYTabBarController *_tabBarController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tabBarController = [[LYTabBarController alloc] init];
    });
    return _tabBarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 自定义TabBar
    [self setUpTabBar];
}

- (void)setUpTabBar {
    // 设置LYTabBar
    [self setValue:[[LYTabBar alloc] initWithFrame:self.tabBar.frame] forKey:@"tabBar"];
}


+ (instancetype)tabBarControllerWithAddChildVCsBlock:(void (^)(LYTabBarController *tabbarController))addViewControllerBlock {
    LYTabBarController *tabbarController = [[LYTabBarController alloc] init];
    if (addViewControllerBlock) {
        addViewControllerBlock(tabbarController);
    }
    return tabbarController;
}

- (void)addChildViewController:(UIViewController *)viewController normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired {
    if (isRequired) {
        LYNavigationController *nav = [[LYNavigationController alloc] initWithRootViewController:viewController];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageWithOriginalImageName:normalImageName] selectedImage:[UIImage imageWithOriginalImageName:selectedImageName]];
        [self addChildViewController:nav];
    } else {
        [self addChildViewController:viewController];
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    
    UIViewController *viewController = self.childViewControllers[selectedIndex];
    // 是否需要显示中间播放按钮
    if (viewController.view.tag == 10086) {
        viewController.view.tag = 0;
        LYMiddlePlayView *middlePlayView = [LYMiddlePlayView middlePlayView];
        
        middlePlayView.middleDidClickBlock = [LYMiddlePlayView shareInstance].middleDidClickBlock;
        middlePlayView.isPlaying = [LYMiddlePlayView shareInstance].isPlaying;
        middlePlayView.middleImage = [LYMiddlePlayView shareInstance].middleImage;
        
        CGRect frame = middlePlayView.frame;
        frame.size.width = 65.0f;
        frame.size.height = 65.0f;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65.0f) * 0.5f;
        frame.origin.y = screenSize.height - 65.0f;
        middlePlayView.frame = frame;
        [viewController.view addSubview:middlePlayView];
    }
    
    
}

@end
