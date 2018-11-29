//
//  UIView+Extension.h
//  ADUser
//
//  Created by maso on 2018/8/10.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)


@property (assign, nonatomic) CGFloat mj_x;
@property (assign, nonatomic) CGFloat mj_y;
@property (assign, nonatomic) CGFloat mj_w;
@property (assign, nonatomic) CGFloat mj_h;
@property (assign, nonatomic) CGSize mj_size;
@property (assign, nonatomic) CGPoint mj_origin;



/**
 设置全部圆角

 @param cornerdious 角度
 */
-(void)setCornerdious:(CGFloat)cornerdious;

/**
  设置圆角，设置某个位置的圆角

 @param cornerdious 角度
 @param corners 位置
 */
-(void)setCornerdious:(CGFloat)cornerdious  Corners:(UIRectCorner)corners ;

/**
 设置border 以及color
 @param borderWidth 宽度
 @param borderColor 颜色
 */
-(void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  添加Tap手势事件
 *
 *  @param target 事件目标
 *  @param action 事件
 *
 *  @return 返回添加的手势
 */
- (UITapGestureRecognizer *)addGestureTapTarget:(id)target action:(SEL)action;

/**
 *  添加Pan手势事件
 *
 *  @param target 事件目标
 *  @param action 事件
 *
 *  @return 返回添加的手势
 */
- (UIPanGestureRecognizer *)addGesturePanTarget:(id)target action:(SEL)action;

/**
 *  添加Pinch手势事件
 *
 *  @param target 事件目标
 *  @param action 事件
 *
 *  @return 返回添加的手势
 */
- (UIPinchGestureRecognizer *)addGesturePinchTarget:(id)target action:(SEL)action;

/**
 *  添加LongPress手势事件
 *
 *  @param target 事件目标
 *  @param action 事件
 *
 *  @return 返回添加的手势
 */
- (UILongPressGestureRecognizer *)addGestureLongPressTarget:(id)target action:(SEL)action;

/**
 *  添加Swipe手势事件
 *
 *  @param target 事件目标
 *  @param action 事件
 *
 *  @return 返回添加的手势
 */
- (UISwipeGestureRecognizer *)addGestureSwipeTarget:(id)target action:(SEL)action;

/**
 *  添加Rotation手势事件
 *
 *  @param target 事件目标
 *  @param action 事件
 *
 *  @return 返回添加的手势
 */
- (UIRotationGestureRecognizer *)addGestureRotationTarget:(id)target action:(SEL)action;

/**
 *  添加ScreenEdgePan手势事件
 *
 *  @param target 事件目标
 *  @param action 事件
 *
 *  @return 返回添加的手势
 */
- (UIScreenEdgePanGestureRecognizer *)addGestureScreenEdgePanTarget:(id)target action:(SEL)action;



#pragma mark - Block

/**
 *  添加Tap手势block事件
 *
 *  @param event block事件
 *
 *  @return 返回添加的手势
 */
- (UITapGestureRecognizer *)addGestureTapEventHandle:(void (^)(id sender, UITapGestureRecognizer *gestureRecognizer))event;

/**
 *  添加Pan手势block事件
 *
 *  @param event block事件
 *
 *  @return 返回添加的手势
 */
- (UIPanGestureRecognizer *)addGesturePanEventHandle:(void (^)(id sender, UIPanGestureRecognizer *gestureRecognizer))event;

/**
 *  添加Pinch手势block事件
 *
 *  @param event block事件
 *
 *  @return 返回添加的手势
 */
- (UIPinchGestureRecognizer *)addGesturePinchEventHandle:(void (^)(id sender, UIPinchGestureRecognizer *gestureRecognizer))event;

/**
 *  添加LongPress手势block事件
 *
 *  @param event block事件
 *
 *  @return 返回添加的手势
 */
- (UILongPressGestureRecognizer *)addGestureLongPressEventHandle:(void (^)(id sender, UILongPressGestureRecognizer *gestureRecognizer))event;

/**
 *  添加Swipe手势block事件
 *
 *  @param event block事件
 *
 *  @return 返回添加的手势
 */
- (UISwipeGestureRecognizer *)addGestureSwipeEventHandle:(void (^)(id sender, UISwipeGestureRecognizer *gestureRecognizer))event;

/**
 *  添加Rotation手势block事件
 *
 *  @param event block事件
 *
 *  @return 返回添加的手势
 */
- (UIRotationGestureRecognizer *)addGestureRotationEventHandle:(void (^)(id sender, UIRotationGestureRecognizer *gestureRecognizer))event;

/**
 *  添加ScreenEdgePan手势block事件
 *
 *  @param event block事件
 *
 *  @return 返回添加的手势
 */
- (UIScreenEdgePanGestureRecognizer *)addGestureScreenEdgePanEventHandle:(void (^)(id sender, UIScreenEdgePanGestureRecognizer *gestureRecognizer))event;


/**
 从xib加载View

 @return 新View
 */
+ (instancetype)iw_viewfromXib;
@end