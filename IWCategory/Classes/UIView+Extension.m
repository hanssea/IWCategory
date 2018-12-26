//
//  UIView+Extension.m
//  ADUser
//
//  Created by maso on 2018/8/10.
//  Copyright © 2018年 Shandong Quanxing Technology Co., Ltd. All rights reserved.
//

#import "UIView+Extension.h"
#import <objc/runtime.h>
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
@end
