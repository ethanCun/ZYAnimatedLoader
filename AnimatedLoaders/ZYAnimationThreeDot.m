//
//  ZYAnimationThreeDot.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/29.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimationThreeDot.h"

@implementation ZYAnimationThreeDot

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat space = 3;

    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    CGFloat signalDotWith = animationAreoWidth/3-3*space;
    CGFloat signalDotHieght = animationAreoHeight/3-3*space;
    
    if (type == ZYAnimateTypeThreeDotRotate) {
        
        CGPoint point1 = CGPointMake(animationAreoWidth/2-signalDotWith/2, 0);
        CGPoint point2 = CGPointMake(0, animationAreoHeight-signalDotHieght);
        CGPoint point3 = CGPointMake(animationAreoWidth-signalDotWith, animationAreoHeight-signalDotHieght);
        
        CAKeyframeAnimation *dotRotateAnimation = [self zy_createKeyFrameAnimationWithKeyPath:@"position"];
        dotRotateAnimation.duration = 1.5f;
        dotRotateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        dotRotateAnimation.repeatCount = HUGE_VAL;
        dotRotateAnimation.fillMode = kCAFillModeForwards;
        dotRotateAnimation.removedOnCompletion = NO;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:point1];
        [path addLineToPoint:point3];
        [path addLineToPoint:point2];
        [path addLineToPoint:point1];

        dotRotateAnimation.path = path.CGPath;
        
        for (NSInteger i=0; i<3; i++) {
            
            dotRotateAnimation.beginTime = i*0.5+0.5;
            
            UIBezierPath *dotPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(signalDotWith/2, signalDotHieght/2, signalDotWith, signalDotHieght)];

            CAShapeLayer *dot = [CAShapeLayer layer];

            if (i == 0) {
                dot.frame = CGRectMake(point1.x, point1.y, signalDotWith, signalDotHieght);
            }else if (i == 1){
                dot.frame = CGRectMake(point2.x, point2.y, signalDotWith, signalDotHieght);
            }else{
                dot.frame = CGRectMake(point3.x, point3.y, signalDotWith, signalDotHieght);
            }
            
            dot.fillColor = tintColor.CGColor;
            dot.path = dotPath.CGPath;
            [layer addSublayer:dot];
            
            [dot addAnimation:dotRotateAnimation forKey:@"animationDotRotate"];
        }
        
        
        return;
    }
    
    
    CABasicAnimation *scaleAnimation = [self zy_createBasicAnimationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithInteger:0.8];
    scaleAnimation.toValue = [NSNumber numberWithInteger:1.5];
    scaleAnimation.duration = 0.8;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.autoreverses = YES;
    
    for (NSInteger i=0; i<3; i++) {
        
        scaleAnimation.beginTime = i*0.3+0.1;
        
        CAShapeLayer *dot = [CAShapeLayer layer];
        dot.fillColor = tintColor.CGColor;
        dot.frame = CGRectMake((signalDotWith+space)*i+space, layer.frame.size.height/2-signalDotHieght/2, signalDotWith, signalDotHieght);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, signalDotWith, signalDotWith)];
        dot.path = path.CGPath;
        
        [layer addSublayer:dot];
        
        [dot addAnimation:scaleAnimation forKey:@"animationThreeDot"];
    }
    
}

@end
