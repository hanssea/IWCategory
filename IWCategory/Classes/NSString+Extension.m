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
+ (NSString *)error:(NSError *)error{
    if ([error.userInfo[@"com.alamofire.serialization.response.error.data"] length]==0) {
        return @"服务维护中...";
    }
    NSData *tempdata =  error.userInfo[@"com.alamofire.serialization.response.error.data"];
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:tempdata options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",resultDic);
    NSString *message = resultDic[@"error"][@"message"];
    NSString *details = resultDic[@"error"][@"details"];
    if (message.length==0) {
        message=@"";
    }if (details.length==0) {
        details=@"";
    }
    NSString *result_msg=[NSString stringWithFormat:@"%@%@",message,details];
    return result_msg;
    
}
@end
