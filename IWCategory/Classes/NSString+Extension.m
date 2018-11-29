//
//  NSString+Extension.m
//  ADoneDriver
//
//  Created by maso on 2018/8/10.
//  Copyright © 2018年 Shandong All-Line Technology Co., Ltd. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}
@end
