//
//  ZYAnimatorCirclePie.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 18/1/2.
//  Copyright © 2018年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorCirclePie.h"

@interface ZYAnimatorCirclePie ()

@end

@implementation ZYAnimatorCirclePie

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat startAngle = -M_PI_2;
    CGFloat endAngle = 3*M_PI_2;
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    CGFloat lineWidth = animationAreoWidth/2;
    
    CGPoint center = CGPointMake(animationAreoWidth/2, animationAreoHeight/2);
    CGFloat radius = animationAreoWidth/2-lineWidth/2;

    CAShapeLayer *pieLayer = [CAShapeLayer layer];
    pieLayer.fillColor = [UIColor clearColor].CGColor;
    pieLayer.strokeColor = tintColor.CGColor;
    pieLayer.lineWidth = lineWidth;
    pieLayer.frame = CGRectMake(0, 0, animationAreoWidth, animationAreoHeight);
    pieLayer.strokeStart = 0;
    pieLayer.strokeEnd = 1.0f;
    
    [layer addSublayer:pieLayer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    pieLayer.path = path.CGPath;
    
    CABasicAnimation *pieAnimation = [self zy_createBasicAnimationWithKeyPath:@"strokeEnd"];
    pieAnimation.fromValue = @0;
    pieAnimation.toValue = @1.0;
    pieAnimation.duration = 2.0f;
    pieAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pieAnimation.removedOnCompletion = YES;
    
    [pieLayer addAnimation:pieAnimation forKey:@"animationPie"];
}


@end
