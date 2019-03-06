//
//  NSString+Extension.m
//  ADoneDriver
//
//  Created by maso on 2018/8/10.
//  Copyright © 2018年 Shandong All-Line Technology Co., Ltd. All rights reserved.
//

#import "NSString+Extension.h"
#import "ADUserConfig.h"
#import <CommonCrypto/CommonDigest.h>

static NSString * salt =@"aujwejxrlorporttnvk";

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
    if (IWIsEmptyString(message)) {
        message=@"Unknown error!";
    }if (IWIsEmptyString(details)) {
        details=@"";
    }
    NSString *result_msg=[NSString stringWithFormat:@"%@%@",message,details];
    return result_msg;
    
}
+ (NSString *)MD5lower:(NSString *)inputmessage
{
    const char *cStr = [[inputmessage stringByAppendingString:salt] UTF8String];
    //开辟一个16字节的空间
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    /*
     extern unsigned char * CC_MD5(const void *data, CC_LONG len, unsigned char *md)官方封装好的加密方法
     把str字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了md这个空间中
     */
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
              result[0], result[1], result[2], result[3],
              result[4], result[5], result[6], result[7],
              result[8], result[9], result[10], result[11],
              result[12], result[13], result[14], result[15]
              ] lowercaseString];  //大小写注意

}
@end
