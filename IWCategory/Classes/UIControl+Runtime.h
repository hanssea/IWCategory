//
//  UIControl+Runtime.h
//  ADUser
//
//  Created by maso on 2018/8/7.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
// 创建block
typedef void (^ActionBlock)(UIControl *control);
@interface UIControl (Runtime)
// 封装button的点击方法
- (void)addMethodBlock:(ActionBlock)actionBlock WithEvents:(UIControlEvents)controlEvents;

// 快速创建button并执行block中的点击方法
- (UIButton *)creatButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font actionBlock:(ActionBlock)actionBlock;


/**
 改变button的布局 文字居左，图片具右

 @param button 要改变布局的button
 @param image button上面展示的图片
 @param title button上面展示的文字
 @param padding  图片与文字之间的间隔
 @return 返回改变后的button
 */
- (UIButton *)creatLeftTitleAndRightImgButtonWithBtn:(UIButton *)button Img:(UIImage *)image title:(NSString *)title padding:(NSInteger)padding;

@end
