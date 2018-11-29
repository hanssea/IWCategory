//
//  UILabel+Extension.m
//  ADUser
//
//  Created by maso on 2018/8/10.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)
+(UILabel *)iwLabelWithText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor frame:(CGRect)frame font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label =[[UILabel alloc]init];
    label.textAlignment = textAlignment;
    label.text = text;
    label.backgroundColor = backgroundColor;
    label.frame= frame;
    label.font = font;
    label.textColor = textColor;
    return label;
}

@end
