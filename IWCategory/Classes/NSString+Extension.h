//
//  NSString+Extension.h
//  ADoneDriver
//
//  Created by maso on 2018/8/10.
//  Copyright © 2018年 Shandong All-Line Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  计算文本占用的宽高
 *
 *  @param font    显示的字体
 *  @param maxSize 最大的显示范围
 *
 *  @return 占用的宽高
 */
-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;
@end
