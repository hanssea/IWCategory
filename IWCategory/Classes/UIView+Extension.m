//
//  UIView+Extension.m
//  ADUser
//
//  Created by maso on 2018/8/10.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>

#define ALPHA  0.2 //背景
#define AlertTime 0.3 //弹出动画时间
#define DropTime 0.5 //落下动画时间
#define ShareTime 0.3//分享时间
@interface UIView ()
@property (nonatomic,assign) JKCustomAnimationMode mode;

@property (nonatomic,assign) BOOL isNeedEffective;
@property (nonatomic,strong) UIView *supView;

@end

@implementation UIView (Extension)


- (void)setMj_x:(CGFloat)mj_x
{
    CGRect frame = self.frame;
    frame.origin.x = mj_x;
    self.frame = frame;
}

- (CGFloat)mj_x
{
    return self.frame.origin.x;
}

- (void)setMj_y:(CGFloat)mj_y
{
    CGRect frame = self.frame;
    frame.origin.y = mj_y;
    self.frame = frame;
}

- (CGFloat)mj_y
{
    return self.frame.origin.y;
}

- (void)setMj_w:(CGFloat)mj_w
{
    CGRect frame = self.frame;
    frame.size.width = mj_w;
    self.frame = frame;
}

- (CGFloat)mj_w
{
    return self.frame.size.width;
}

- (void)setMj_h:(CGFloat)mj_h
{
    CGRect frame = self.frame;
    frame.size.height = mj_h;
    self.frame = frame;
}

- (CGFloat)mj_h
{
    return self.frame.size.height;
}

- (void)setMj_size:(CGSize)mj_size
{
    CGRect frame = self.frame;
    frame.size = mj_size;
    self.frame = frame;
}

- (CGSize)mj_size
{
    return self.frame.size;
}

- (void)setMj_origin:(CGPoint)mj_origin
{
    CGRect frame = self.frame;
    frame.origin = mj_origin;
    self.frame = frame;
}

- (CGPoint)mj_origin
{
    return self.frame.origin;
}





-(void)setCornerdious:(CGFloat)cornerdious{
    self.layer.cornerRadius = cornerdious;
    self.layer.masksToBounds = YES;
}

-(void)setBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}

-(void)setCornerdious:(CGFloat)cornerdious Corners:(UIRectCorner)corners {

    UIBezierPath * maskPath =[UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerdious, cornerdious)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

- (NSMutableDictionary *)gestureBlocks
{
    id obj = objc_getAssociatedObject(self, _cmd);
    if (!obj) {
        obj = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(gestureBlocks), obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return obj;
}



#pragma mark - Category Events

- (id)addGestureTarget:(id)target action:(SEL)action gestureClass:(Class)class {
    UIGestureRecognizer *gesture = [[class alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:gesture];
    return gesture;
}

- (UITapGestureRecognizer *)addGestureTapTarget:(id)target action:(SEL)action {
    return [self addGestureTarget:target action:action gestureClass:[UITapGestureRecognizer class]];
}

- (UIPanGestureRecognizer *)addGesturePanTarget:(id)target action:(SEL)action {
    return [self addGestureTarget:target action:action gestureClass:[UIPanGestureRecognizer class]];
}

- (UIPinchGestureRecognizer *)addGesturePinchTarget:(id)target action:(SEL)action {
    return [self addGestureTarget:target action:action gestureClass:[UIPinchGestureRecognizer class]];
}

- (UILongPressGestureRecognizer *)addGestureLongPressTarget:(id)target action:(SEL)action {
    return [self addGestureTarget:target action:action gestureClass:[UILongPressGestureRecognizer class]];
}

- (UISwipeGestureRecognizer *)addGestureSwipeTarget:(id)target action:(SEL)action {
    return [self addGestureTarget:target action:action gestureClass:[UISwipeGestureRecognizer class]];
}

- (UIRotationGestureRecognizer *)addGestureRotationTarget:(id)target action:(SEL)action {
    return [self addGestureTarget:target action:action gestureClass:[UIRotationGestureRecognizer class]];
}

- (UIScreenEdgePanGestureRecognizer *)addGestureScreenEdgePanTarget:(id)target action:(SEL)action {
    return [self addGestureTarget:target action:action gestureClass:[UIScreenEdgePanGestureRecognizer class]];
}



#pragma mark - Category Block Events

- (id)addGestureEventHandle:(void (^)(id, id))event gestureClass:(Class)class {
    UIGestureRecognizer *gesture = [[class alloc] initWithTarget:self action:@selector(handleGestureRecognizer:)];
    [self addGestureRecognizer:gesture];
    if (event) {
        [[self gestureBlocks] setObject:event forKey:NSStringFromClass(class)];
    }
    return gesture;
}

- (UITapGestureRecognizer *)addGestureTapEventHandle:(void (^)(id sender, UITapGestureRecognizer *recognizer))event {
    return [self addGestureEventHandle:event gestureClass:[UITapGestureRecognizer class]];
}

- (UIPanGestureRecognizer *)addGesturePanEventHandle:(void (^)(id sender, UIPanGestureRecognizer *recognizer))event {
    return [self addGestureEventHandle:event gestureClass:[UIPanGestureRecognizer class]];
}

- (UIPinchGestureRecognizer *)addGesturePinchEventHandle:(void (^)(id sender, UIPinchGestureRecognizer *recognizer))event {
    return [self addGestureEventHandle:event gestureClass:[UIPinchGestureRecognizer class]];
}

- (UILongPressGestureRecognizer *)addGestureLongPressEventHandle:(void (^)(id sender, UILongPressGestureRecognizer *recognizer))event {
    return [self addGestureEventHandle:event gestureClass:[UILongPressGestureRecognizer class]];
}

- (UISwipeGestureRecognizer *)addGestureSwipeEventHandle:(void (^)(id sender, UISwipeGestureRecognizer *recognizer))event {
    return [self addGestureEventHandle:event gestureClass:[UISwipeGestureRecognizer class]];
}

- (UIRotationGestureRecognizer *)addGestureRotationEventHandle:(void (^)(id sender, UIRotationGestureRecognizer *recognizer))event {
    return [self addGestureEventHandle:event gestureClass:[UIRotationGestureRecognizer class]];
}

- (UIScreenEdgePanGestureRecognizer *)addGestureScreenEdgePanEventHandle:(void (^)(id sender, UIScreenEdgePanGestureRecognizer *recognizer))event {
    return [self addGestureEventHandle:event gestureClass:[UIScreenEdgePanGestureRecognizer class]];
}



#pragma mark -

- (void)handleGestureRecognizer:(UIGestureRecognizer *)gesture
{
    NSString *key = NSStringFromClass(gesture.class);
    void (^block)(id sender, UIGestureRecognizer *tap) = [self gestureBlocks][key];
    block ? block(self, gesture) : nil;
}

+ (instancetype)iw_viewfromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
+ (instancetype)iw_viewFromBudle{
    NSBundle *budle=[NSBundle bundleForClass:[self class]];
    return [[budle loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}


/***动画相关****/
-(void)setMode:(JKCustomAnimationMode)mode{
    objc_setAssociatedObject(self, @selector(mode), @(mode), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(JKCustomAnimationMode)mode {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

-(void)setSupView:(UIView *)supView{
    objc_setAssociatedObject(self, @selector(supView), supView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIView*)supView {
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setIsTapBgViewUnUse:(BOOL)isTapBgViewUnUse{
    objc_setAssociatedObject(self, @selector(isTapBgViewUnUse), @(isTapBgViewUnUse), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)isTapBgViewUnUse{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
-(void)setIsNeedEffective:(BOOL)isNeedEffective{
    objc_setAssociatedObject(self, @selector(isNeedEffective), @(isNeedEffective), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BOOL)isNeedEffective{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

-(void)setBgAlpha:(CGFloat)bgAlpha{
    objc_setAssociatedObject(self, @selector(bgAlpha), @(bgAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)bgAlpha {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}
-(void)setAnimationTime:(CGFloat)animationTime{
    objc_setAssociatedObject(self, @selector(animationTime), @(animationTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)animationTime{
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

-(void)jk_showInWindowWithMode:(JKCustomAnimationMode)animationMode inView:(UIView *)superV bgAlpha:(CGFloat)alpha needEffectView:(BOOL)isNeed{
    self.mode = animationMode;
    self.bgAlpha = alpha;
    self.isNeedEffective = isNeed;
    self.supView = superV;
    self.animationTime = [self getAnimationTimeWithMode:animationMode];
    [self keyBoardListen];
    switch (animationMode) {
        case JKCustomAnimationModeAlert:
            [self showInWindow];
            break;
        case JKCustomAnimationModeDrop:
            [self upToDownShowInWindow];
            break;
        case JKCustomAnimationModeShare:
            [self shareViewShowInWindow];
            break;
            
        case JKCustomAnimationModeNone:
            [self showViewWithOutAnimation];
            break;
        default:
            break;
    }
}



-(void)tapBgView{
    
    switch (self.mode) {
        case JKCustomAnimationModeAlert:
            [self alertHide];
            break;
        case JKCustomAnimationModeDrop:
            [self dropDown];
            break;
        case JKCustomAnimationModeShare:
            [self hideShareView];
            break;
        case JKCustomAnimationModeNone:
            [self hideWithOutAnimation];
            break;
        default:
            
            break;
    }
}
-(void)tapBgViewGuesture {
    if (self.isTapBgViewUnUse) {
        return;
    }
    [self tapBgView];
}

-(void)jk_hideView{
    [self removeKeyBoardListen];
    [self tapBgView];
}

#pragma mark- 动画显示

//弹出动画
-(void)showInWindow{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    if (self.supView) {
        [self.supView addSubview:self];
        self.center = self.supView.center;
    }else{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.center = [UIApplication sharedApplication].keyWindow.center;
    }
    
    self.alpha = 0;
    self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
    [UIView animateWithDuration:self.animationTime animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alpha = 1;
    }];
}
//下滑出动画
-(void)upToDownShowInWindow{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    CGFloat x = ([UIApplication sharedApplication].keyWindow.bounds.size.width-self.frame.size.width)/2;
    CGFloat y = -self.frame.size.height;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.frame = CGRectMake(x, y, width, height);
    [UIView animateWithDuration:self.animationTime delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.center = [UIApplication sharedApplication].keyWindow.center;
    } completion:^(BOOL finished) {
        
    }];
}

/**
 下方弹出分享视图
 */
-(void)shareViewShowInWindow{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height, self.frame.size.width, self.frame.size.height);
    // usingSpringWithDamping数值越小，弹簧震动效果越好
    [UIView animateWithDuration:self.animationTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveLinear animations:^{
        CGRect  oldFrame = self.frame;
        oldFrame.origin.y = self.frame.origin.y-self.frame.size.height;
        self.frame = oldFrame;
    } completion:^(BOOL finished) {
        
    }];
}
-(void)showViewWithOutAnimation{
    if (self.superview) {
        [self removeFromSuperview];
    }
    [self addViewInWindow];
    if (self.supView) {
        [self.supView addSubview:self];
        
    }else{
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    }
    
    self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height-self.frame.size.height, self.frame.size.width, self.frame.size.height);
    
    
    
    // usingSpringWithDamping数值越小，弹簧震动效果越好
    //    [UIView animateWithDuration:ShareTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveLinear animations:^{
    //        CGRect  oldFrame = self.frame;
    //        oldFrame.origin.y = self.frame.origin.y-self.frame.size.height+5;
    //        self.frame = oldFrame;
    //    } completion:^(BOOL finished) {
    //
    //    }];
}


#pragma mark - 动画隐藏

//弹出隐藏
-(void)alertHide{
    if (self.superview) {
        [UIView animateWithDuration:self.animationTime animations:^{
            //            self.transform = CGAffineTransformScale(self.transform,0.1,0.1);
            self.transform = CGAffineTransformIdentity;
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [self hideAnimationFinish];
        }];
    }
}
//下滑隐藏
-(void)dropDown{
    if (self.superview) {
        [UIView animateWithDuration:self.animationTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.frame = CGRectMake(self.frame.origin.x, [UIApplication sharedApplication].keyWindow.bounds.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            [self hideAnimationFinish];
        }];
    }
}


/**
 下方分享视图隐藏
 */
-(void)hideShareView{
    if (self.superview) {
        [UIView animateWithDuration:self.animationTime delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height, self.frame.size.width, self.frame.size.height);
        } completion:^(BOOL finished) {
            [self hideAnimationFinish];
        }];
    }
}

-(void)hideWithOutAnimation{
    UIView *bgvi = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    if (bgvi) {
        [bgvi removeFromSuperview];
    }
    [self removeFromSuperview];
}

/*
 -(void)hideBigImageView{
 if (self.superview) {
 [UIView animateWithDuration:AlertTime animations:^{
 self.frame = oldFrame;
 } completion:^(BOOL finished) {
 UIView *bgvi = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
 if (bgvi) {
 [bgvi removeFromSuperview];
 }
 }];
 }
 }
 */

-(void)hideAnimationFinish{
    UIView *bgvi = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    if (bgvi) {
        [bgvi removeFromSuperview];
    }
    [self removeFromSuperview];
}





/**
 加入背景view
 */
-(void)addViewInWindow{
    UIView *oldView;
    if (self.supView) {
        oldView = [self.supView viewWithTag:TagValue];
    }else{
        oldView = [[UIApplication sharedApplication].keyWindow viewWithTag:TagValue];
    }
    if (oldView) {
        [oldView removeFromSuperview];
    }
    UIView *v = [[UIView alloc] initWithFrame:[UIApplication sharedApplication].keyWindow.bounds];
    v.tag = TagValue;
    [self addGuesture:v];
    v.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:self.bgAlpha == -1 ? ALPHA : self.bgAlpha];
    if (self.isNeedEffective) {
        UIVisualEffectView *effectView =[[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        effectView.frame = v.frame;
        effectView.alpha = 0.6;
        [v addSubview:effectView];
    }
    if (self.supView) {
        [self.supView addSubview:v];
    }else{
        [[UIApplication sharedApplication].keyWindow addSubview:v];
    }
    
}
//添加背景view手势
-(void)addGuesture:(UIView *)vi{
    vi.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBgViewGuesture)];
    [vi addGestureRecognizer:tap];
}

- (void)jk_setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (!view) {
        view = self;
    }
    if (top) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}


-(CGFloat)getAnimationTimeWithMode:(JKCustomAnimationMode)type{
    switch (type) {
        case JKCustomAnimationModeNone:
            return 0;
        case JKCustomAnimationModeShare:
            return self.frame.size.height / 300 * ShareTime;
        case JKCustomAnimationModeDrop:
            return DropTime;
        case JKCustomAnimationModeAlert:
            return AlertTime;
            
        default:
            break;
    }
}


#pragma mark - 键盘弹起监听
- (void)keyBoardListen {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)removeKeyBoardListen{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary *userInfo = [noti userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;  // 得到键盘弹出后的键盘视图所在y坐标;
    CGFloat space = self.mode == JKCustomAnimationModeNone ? 0: 10.0;
    if (CGRectGetMaxY(self.frame)>=keyBoardEndY) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect _frame = self.frame;
            _frame.origin.y = keyBoardEndY-_frame.size.height-space;
            self.frame = _frame;
        }];
    }
    
}

- (void)keyboardWillHide:(NSNotification *)noti {
    
    
    [UIView animateWithDuration:0.5 animations:^{
        if (self.mode==JKCustomAnimationModeShare||self.mode==JKCustomAnimationModeNone) {
            self.frame = CGRectMake(0, [UIApplication sharedApplication].keyWindow.bounds.size.height-self.frame.size.height, self.frame.size.width, self.frame.size.height);
        }else{
            self.center = [UIApplication sharedApplication].keyWindow.center;
        }
    }];
}
@end
