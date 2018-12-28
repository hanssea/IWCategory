//
//  UIImage+Extension.h
//  ADUser
//
//  Created by maso on 2018/8/15.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


/* Navigation Buttons */

/**
 *  creat back button icon
 *
 *  @return UIImage
 */
+ (id)cy_backButtonIcon:(UIColor*)color;

/**
 *  creat forward button icon
 *
 *  @return UIImage
 */
+ (id)cy_forwardButtonIcon;


/**
 *  creat refresh button icon
 *
 *  @return UIImage
 */
+ (id)cy_refreshButtonIcon;


/**
 *  creat stop button icon
 *
 *  @return UIImage
 */
+ (id)cy_stopButtonIcon;

/**
 *  creat action button icon
 *
 *  @return UIImage
 */
+ (id)cy_actionButtonIcon;


/**
 根据验证生成图片

 @param color 颜色值
 @return 新图片
 */
+(UIImage*)iwImageWithColor:(UIColor*)color;



/**
 图片不被渲染

 */
+ (UIImage *)originImageWithName: (NSString *)name;

- (UIImage *)circleImage;


/**
 从pod中加载图片
 */
+ (instancetype)iw_imagePathWithName:(NSString *)imageName bundle:(NSString *)bundle targetClass:(Class)targetClass;
@end
