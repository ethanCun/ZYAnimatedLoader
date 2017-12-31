//
//  ZYAnimatorCircleBreathe.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/31.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorCircleBreathe.h"

@implementation ZYAnimatorCircleBreathe

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    CGFloat circleRadius = animationAreoWidth/2;
    
    CABasicAnimation *circleAnimation = [self zy_createBasicAnimationWithKeyPath:@"transform.scale"];
    circleAnimation.duration = 1.0f;
    circleAnimation.repeatCount = HUGE_VAL;
    circleAnimation.removedOnCompletion = NO;
    circleAnimation.autoreverses = YES;
    
    for (NSInteger i=0; i<2; i++) {
        
        circleAnimation.beginTime = i*2.0+0.5;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, animationAreoWidth, animationAreoHeight)];
        
        CAShapeLayer *circle = [CAShapeLayer layer];
        circle.anchorPoint = CGPointMake(1.0, 1.0);
        circle.frame = CGRectMake(0, 0, circleRadius, circleRadius);

        if (i == 0) {
            circle.fillColor = [UIColor lightGrayColor].CGColor;
            circleAnimation.fromValue = [NSNumber numberWithFloat:0];
            circleAnimation.toValue = [NSNumber numberWithFloat:1.0];
        }else{
            circle.fillColor = tintColor.CGColor;
            circleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
            circleAnimation.toValue = [NSNumber numberWithFloat:0];
        }
        
        circle.path = path.CGPath;
        
        [circle addAnimation:circleAnimation forKey:@"animationBreathe"];
        
        [layer addSublayer:circle];
    }
    
}
@end
