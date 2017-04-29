//
//  LYMainModuleAPI.h
//  LYXiMaLaYaFMMain
//
//  Created by LiuY on 2017/4/29.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LYTabBarController, LYMiddlePlayView;

@interface LYMainModuleAPI : NSObject

/**
 获取根控制器

 @return rootTabBarCcontroller
 */
+ (LYTabBarController *)rootTabBarCcontroller;


/**
 添加子控制器
 
 @param viewController 需要添加的子控制器
 @param normalImageName 普通状态下的图片
 @param selectedImageName 选择状态下的图片
 @param isRequired 是否要包装导航控制器
 */
+ (void)addChildViewController:(UIViewController *)viewController normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired;



/**
 设置tabbar中间控件的点击代码块

 @param middleDidClickBlock 点击响应代码块
 */
+ (void)setTabbarMiddleButtonDidClick:(void(^)(BOOL isPlaying))middleDidClickBlock;

/**
 *  设置全局的导航栏背景图
 *
 *  @param globalImage 全局导航栏背景图片
 */
+ (void)setNavBarGlobalBackGroundImage: (UIImage *)globalImage;

/**
 *  设置全局导航栏标题颜色和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏字体大小
 */
+ (void)setNavBarGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize;


/**
 快速获取中间播放按钮

 @return middlePlayView
 */
+ (LYMiddlePlayView *)middlePlayView;

@end
