//
//  ZYAnimatorSuper.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorSuper.h"

@implementation ZYAnimatorSuper

- (CABasicAnimation *)zy_createBasicAnimationWithKeyPath:(NSString *)keyPath
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:keyPath];
    basicAnimation.repeatCount = MAXFLOAT;
    
    return basicAnimation;
}

- (CAKeyframeAnimation *)zy_createKeyFrameAnimationWithKeyPath:(NSString *)keyPath
{
    CAKeyframeAnimation *keyFrameAnimation = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    keyFrameAnimation.repeatCount = MAXFLOAT;
    
    return keyFrameAnimation;
    
}

- (CAAnimationGroup *)zy_createAnimationGrooup
{
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.repeatCount = MAXFLOAT;
    
    return animationGroup;
}

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor keyPath:(NSString *)keyPath{}

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor keyPath:(NSString *)keyPath type:(ZYAnimateType)type{}
- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type{}
@end
