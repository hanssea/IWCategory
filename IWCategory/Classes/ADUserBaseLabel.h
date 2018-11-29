//
//  ADUserBaseLabel.h
//  ADUser
//
//  Created by alldone on 2018/11/9.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//  调整lable内边距

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface ADUserBaseLabel : UILabel
@property (nonatomic, assign) IBInspectable CGFloat topEdge;
@property (nonatomic, assign) IBInspectable CGFloat leftEdge;
@property (nonatomic, assign) IBInspectable CGFloat bottomEdge;
@property (nonatomic, assign) IBInspectable CGFloat rightEdge;
@property (nonatomic, assign) UIEdgeInsets contentEdgeInsets;
@end
