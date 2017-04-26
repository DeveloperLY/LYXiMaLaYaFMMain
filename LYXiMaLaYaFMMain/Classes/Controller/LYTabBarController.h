//
//  LYTabBarController.h
//  LYXiMaLaYaFMMain
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTabBarController : UITabBarController

/**
 *  获取单例对象
 *
 *  @return LYTabBarController
 */
+ (instancetype)shareInstance;


/**
 添加子控制器的Block

 @param addViewControllerBlock 添加代码块
 @return LYTabBarController
 */
+ (instancetype)tabBarControllerWithAddChildVCsBlock:(void (^)(LYTabBarController *tabbarController))addViewControllerBlock;


/**
 添加子控制器

 @param viewController 需要添加的子控制器
 @param normalImageName 普通状态下的图片
 @param selectedImageName 选择状态下的图片
 @param isRequired 是否要包装导航控制器
 */
- (void)addChildViewController:(UIViewController *)viewController normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired;

@end
