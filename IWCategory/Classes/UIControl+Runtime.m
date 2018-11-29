//
//  UIControl+Runtime.m
//  ADUser
//
//  Created by maso on 2018/8/7.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import "UIControl+Runtime.h"
#import "UIImage+Extension.h"
@implementation UIControl (Runtime)
// 静态变量
static char overview = 'a';

- (void)addMethodBlock:(ActionBlock)actionBlock WithEvents:(UIControlEvents)controlEvents{
    ///id object, const void *key, id value, objc_AssociationPolicy policy
    objc_setAssociatedObject(self, &overview, actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(myAction) forControlEvents:controlEvents];
    
}

- (void)myAction{
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overview);
    if (block) {
        block(self);
    }
}

- (UIButton *)creatButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)color titleFont:(UIFont *)font actionBlock:(ActionBlock)actionBlock
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundColor:backgroundColor];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setBackgroundImage:[UIImage iwImageWithColor:[UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:0.5]] forState:UIControlStateHighlighted];
    [button setTitleColor:color forState:(UIControlStateNormal)];
    [button addMethodBlock:actionBlock WithEvents:UIControlEventTouchUpInside];
    return button;
}

- (UIButton *)creatLeftTitleAndRightImgButtonWithBtn:(UIButton *)button Img:(UIImage *)image title:(NSString *)title padding:(NSInteger)padding
{
    [button setTitle:title forState:(UIControlStateNormal)];
    [button setImage:image forState:(UIControlStateNormal)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -button.imageView.frame.size.width-padding, 0, button.imageView.frame.size.width-padding)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, button.titleLabel.bounds.size.width+padding, 0, -button.titleLabel.bounds.size.width-padding)];
    return button;
}

@end
