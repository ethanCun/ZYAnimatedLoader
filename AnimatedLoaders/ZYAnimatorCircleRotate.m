//
//  ZYAnimatorCircleRotate.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorCircleRotate.h"

@implementation ZYAnimatorCircleRotate

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat lineWidth = 5;

    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat circleRadius= animationAreoWidth/2-2*lineWidth;
    CGPoint center = CGPointZero;

    CAKeyframeAnimation *rotateAnimation = [self zy_createKeyFrameAnimationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.values = @[@0, @(M_PI*2)];
    rotateAnimation.duration = 1.0f;
    rotateAnimation.repeatCount = HUGE_VAL;
    
    CABasicAnimation *scaleAnimation = [self zy_createBasicAnimationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    scaleAnimation.toValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.duration = 0.5f;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.autoreverses = YES;
    scaleAnimation.repeatCount = HUGE_VAL;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[rotateAnimation, scaleAnimation];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    group.duration = 1.0f;
    group.repeatCount = HUGE_VAL;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:circleRadius startAngle:0 endAngle:M_PI*3/2 clockwise:YES];
    
    CAShapeLayer *rotateCircleLayer = [CAShapeLayer layer];
    rotateCircleLayer.position = CGPointMake(animationAreoWidth/2, animationAreoWidth/2);
    rotateCircleLayer.path = path.CGPath;
    rotateCircleLayer.fillColor = [UIColor clearColor].CGColor;
    rotateCircleLayer.strokeColor = tintColor.CGColor;
    rotateCircleLayer.lineWidth = lineWidth;
    rotateCircleLayer.lineCap = kCALineCapRound;
    
    [rotateCircleLayer addAnimation:group forKey:@"animationCircleRotate"];
    
    [layer addSublayer:rotateCircleLayer];
}

@end
