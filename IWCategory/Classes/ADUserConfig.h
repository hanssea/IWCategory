//
//  ADUserConfig.h
//  ADUser
//
//  Created by maso on 2018/8/7.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//  基础宏定义文件

#ifndef ADUserConfig_h
#define ADUserConfig_h

// 1.自定义Log
#ifdef DEBUG
#define IWLog(...) NSLog(__VA_ARGS__)
#else
#define IWLog(...)
#endif


// 2.获得RGB颜色
#define IWColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 3.字号
#define IWFONT(NAME, FONTSIZE)     [UIFont fontWithName:(NAME) size:(FONTSIZE)]
//弱引用
#define WeakSelf(weakSelf)  __weak __typeof(self) weakSelf = self;


// 4.宽度宏
#define IWScreen_Width   [UIScreen mainScreen].bounds.size.width
#define IWScreen_Height  [UIScreen mainScreen].bounds.size.height

// 6.判断它是否是空字符串。
#define IWIsEmptyString(s) (s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0))

#define IWIsString(s) (([s isKindOfClass:[NSString class]] && s.length != 0))

// 7.判断它是否为nil或null对象。
#define IWIsEmptyObject(obj) (obj == nil || [obj isKindOfClass:[NSNull class]])

// 8.判断它是否是一个有效的字典。
#define IWIsDictionary(objDict) (objDict != nil && [objDict isKindOfClass:[NSDictionary class]])

// 9.判断它是否是一个有效的数组。
#define IWIsArray(objArray) (objArray != nil && [objArray isKindOfClass:[NSArray class]])


// 10.判断是否是 iPhoneX
#define IWIs_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 14 通知中心
#define IWCenter   [NSNotificationCenter defaultCenter]
#define IWNSUserDefaults     [NSUserDefaults standardUserDefaults]
// 15 用户维度
#define IWUserLatitude  [IWNSUserDefaults objectForKey:IWLatitude]
// 16 用户经度
#define IWUserLongitude  [IWNSUserDefaults objectForKey:IWLongitude]

#define IWUserPOIName  [IWNSUserDefaults objectForKey:IWPOIName]

#define IWUserAddress  [IWNSUserDefaults objectForKey:IWAddress]

#define IWSuccess  [returnData[@"success"] integerValue]==1
// 17 服务器错误信息
#define IWError      [ADUserTool trackError:error]
// 18 服务器错误信息
#define IWErrorMessage      [ADUserTool Error:error]


#define IWImg(imgName)      [UIImage imageNamed:imgName]

#define IWCacheTime    300


#define IWMoreIphoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})


#endif /* ADUserConfig_h */
