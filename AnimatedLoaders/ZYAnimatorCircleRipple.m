//
//  ZYAnimatorCircleRipple.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/31.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorCircleRipple.h"

@implementation ZYAnimatorCircleRipple

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
 
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, animationAreoWidth, animationAreoHeight)];
    
    for (NSInteger i=0; i<4; i++) {
        
        CAShapeLayer *circle = [CAShapeLayer layer];
        circle.fillColor = tintColor.CGColor;
        circle.frame = CGRectMake(0, 0, animationAreoWidth, animationAreoHeight);
        circle.path = path.CGPath;
        circle.anchorPoint = CGPointMake(0.5, 0.5);
        [layer addSublayer:circle];
        
        CABasicAnimation *opacityAnimation = [self zy_createBasicAnimationWithKeyPath:@"opacity"];
        opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        opacityAnimation.toValue = [NSNumber numberWithFloat:0];
        opacityAnimation.removedOnCompletion = NO;
        opacityAnimation.duration = 1.0f;
        opacityAnimation.repeatCount = HUGE_VAL;
        
        CAKeyframeAnimation *scaleAnimation = [self zy_createKeyFrameAnimationWithKeyPath:@"transform.scale"];
        scaleAnimation.values = @[@0, @1.0];
        scaleAnimation.autoreverses = YES;
        scaleAnimation.duration = 1.0f;
        scaleAnimation.repeatCount = HUGE_VAL;
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.animations = @[opacityAnimation, scaleAnimation];
        animationGroup.duration = 1.0f;
        animationGroup.repeatCount = HUGE_VAL;
        animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animationGroup.beginTime = i*0.2+0.2;
        
        [circle addAnimation:animationGroup forKey:@"animationBreathe"];
    }
}


@end
