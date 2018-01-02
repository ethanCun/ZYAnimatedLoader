//
//  ZYAnimator.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimator.h"
#import "ZYAnimatorLine.h"
#import "ZYAnimatorNineDot.h"
#import "ZYAnimatorDoubleDot.h"
#import "ZYAnimationThreeDot.h"
#import "ZYAnimatorWaveBall.h"
#import "ZYAnimatorCircleRotate.h"
#import "ZYAnimatorCircleRipple.h"
#import "ZYAnimatorCircleBreathe.h"
#import "ZYAnimatorCircleDot.h"
#import "ZYAnimatorCirclePie.h"

const float ZYDefaultWith = 40.f;

@interface ZYAnimator ()

/**动画层*/
@property (nonatomic, strong) CALayer *animateLayer;
/**类型*/
@property (nonatomic, assign) ZYAnimateType type;
/**波浪*/
@property (nonatomic, strong) ZYAnimatorWaveBall *wave;

@end

@implementation ZYAnimator

static ZYAnimator *animatr = nil;


#pragma mark - 初始化
- (id)initAnimateWithType:(ZYAnimateType)type
{
    if (self = [super init]) {
        
        _type = type;
        
        _animateLayer = [CALayer layer];
        _animateLayer.frame = CGRectMake(0, 0, ZYDefaultWith*2, ZYDefaultWith*2);
        [self.layer addSublayer:_animateLayer];
        
    }
    
    return self;
}

- (id)initAnimateWithType:(ZYAnimateType)type tintColor:(UIColor *)tintColor
{
    if (self = [super init]) {
        
        _type = type;
        _tintColor = tintColor;
        
        _animateLayer = [CALayer layer];
        _animateLayer.frame = CGRectMake(0, 0, ZYDefaultWith*2, ZYDefaultWith*2);
        [self.layer addSublayer:_animateLayer];
        
    }
    
    return self;
}

#pragma mark - tintColor
- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
}

#pragma mark - backgroundColor
- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    
    _animateLayer.backgroundColor = _backgroundColor.CGColor;

}

#pragma mark - frame
- (void)setFrame:(CGRect)frame
{
    _animateLayer.frame = frame;
}

#pragma mark - 开始动画
- (void)startAnimation
{
    if (!_tintColor) {
        _tintColor = [UIColor redColor];
    }
    
    if (_type == ZYAnimateTypeLineX) {
        
        ZYAnimatorLine *line = [self getInstanceAnimatorWithType:_type];
        
        [line zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor keyPath:@"transform.scale.x"];
        
    }else if (_type == ZYAnimateTypeLineY){
    
        ZYAnimatorLine *line = [self getInstanceAnimatorWithType:_type];
        
        [line zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor keyPath:@"transform.scale.y"];
        
    }else if (_type == ZYAnimateTypeLineCenterY){
        
        ZYAnimatorLine *line = [self getInstanceAnimatorWithType:_type];
        
        [line zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor keyPath:@"transform.scale.y" type:_type];
    }else if (_type == ZYAnimateTypeDoubleDotScale || _type == ZYAnimateTypeDoubleDotRotate){
        
        ZYAnimatorDoubleDot *doubleDot = [self getInstanceAnimatorWithType:_type];
        
        [doubleDot zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeNineDot){
        
        ZYAnimatorNineDot *nineDot = [self getInstanceAnimatorWithType:_type];
        
        [nineDot zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeNineSquare){
        
        ZYAnimatorNineDot *nineDot = [self getInstanceAnimatorWithType:_type];
        
        [nineDot zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeThreeDotLine){
        
        ZYAnimationThreeDot *threeDot = [self getInstanceAnimatorWithType:_type];
        
        [threeDot zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeThreeDotRotate){
        
        ZYAnimationThreeDot *threeDot = [self getInstanceAnimatorWithType:_type];
        
        [threeDot zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeCircleRotate){
        
        ZYAnimatorCircleRotate *circleRotate = [self getInstanceAnimatorWithType:_type];
        
        [circleRotate zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeWaveBall){
        
        self.wave = [self getInstanceAnimatorWithType:_type];
        
        [self.wave zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeCircleRipple){
    
        ZYAnimatorCircleRipple *circleRipple = [self getInstanceAnimatorWithType:_type];
        
        [circleRipple zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
    
    }else if (_type == ZYAnimateTypeCircleBreathe){
        
        ZYAnimatorCircleBreathe *circlrBreathe = [self getInstanceAnimatorWithType:_type];
        
        [circlrBreathe zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
        
    }else if (_type == ZYAnimateTypeCircleDot){
        
        ZYAnimatorCircleDot *circleDot = [self getInstanceAnimatorWithType:_type];
        
        [circleDot zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
    }else if (_type == ZYAnimateTypeCirclePie){
        
        ZYAnimatorCirclePie *circlePie = [self getInstanceAnimatorWithType:_type];
        
        [circlePie zy_setupLayer:_animateLayer size:CGSizeMake(ZYDefaultWith, ZYDefaultWith) tintColor:_tintColor type:_type];
    }
}

#pragma mark - 结束动画
- (void)stopAnimate
{
    [self.wave stopDisplayLink];
    
    _animateLayer.speed = 0;
    [_animateLayer removeFromSuperlayer];
    _animateLayer = nil;
}

#pragma mark - 获取子类实例变量
- (id)getInstanceAnimatorWithType:(ZYAnimateType)type
{
    if (type == ZYAnimateTypeLineX || _type == ZYAnimateTypeLineY || _type == ZYAnimateTypeLineCenterY) {
        return [[ZYAnimatorLine alloc] init];
    }else if (type == ZYAnimateTypeNineDot || type == ZYAnimateTypeNineSquare){
        return [[ZYAnimatorNineDot alloc] init];
    }else if (type == ZYAnimateTypeDoubleDotScale || type == ZYAnimateTypeDoubleDotRotate){
        return [[ZYAnimatorDoubleDot alloc] init];
    }else if (type == ZYAnimateTypeThreeDotLine || type == ZYAnimateTypeThreeDotRotate){
        return [[ZYAnimationThreeDot alloc] init];
    }else if (type == ZYAnimateTypeWaveBall){
        return [[ZYAnimatorWaveBall alloc] init];
    }else if (type == ZYAnimateTypeCircleRotate){
        return [[ZYAnimatorCircleRotate alloc] init];
    }else if (type == ZYAnimateTypeCircleRipple){
        return [[ZYAnimatorCircleRipple alloc] init];
    }else if (type == ZYAnimateTypeCircleBreathe){
        return [[ZYAnimatorCircleBreathe alloc] init];
    }else if (type == ZYAnimateTypeCircleDot){
        return [[ZYAnimatorCircleDot alloc] init];
    }else if (type == ZYAnimateTypeCirclePie){
        return [[ZYAnimatorCirclePie alloc] init];
    }
    
    return nil;
}

#pragma mark - dealloc
- (void)dealloc{
    NSLog(@"dealloc");
}

@end
