//
//  UIColor+Extension.h
//  ADUser
//
//  Created by maso on 2018/8/16.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
/**
 * hex color to rgd color, where hexString, such as: #FF00FF
 **/
+ (UIColor *)colorFromHexString:(NSString *)hexString;

+ (UIImage*)imageWithColor:(UIColor*)color;
@end
