//
//  ZYAnimatorDoubleDot.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorDoubleDot.h"

@implementation ZYAnimatorDoubleDot

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    CGFloat signalDotWith = 0;
    CGFloat signalDotHieght = 0;
    
    CAKeyframeAnimation *animaton;
    
    if (type == ZYAnimateTypeDoubleDotScale) {
        
        signalDotWith = animationAreoWidth/2;
        signalDotHieght = animationAreoHeight/2;
        
        animaton = [self zy_createKeyFrameAnimationWithKeyPath:@"transform.scale"];
        animaton.values = @[@1.0, @0];
        animaton.autoreverses = YES;
        animaton.duration = 1.0f;
        animaton.repeatCount = HUGE_VAL;
        
        for (NSInteger i=0; i<2; i++) {
            
            CAShapeLayer *circle = [CAShapeLayer layer];
            
            circle.anchorPoint = CGPointMake(0.5, 0.5);
            
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, signalDotWith, signalDotWith)];
            circle.path = path.CGPath;
            
            if (i == 0) {
                
                circle.frame = CGRectMake(0, signalDotHieght/2, signalDotWith, signalDotHieght);
            }else{
                
                circle.frame = CGRectMake(animationAreoWidth-signalDotWith, signalDotHieght/2, signalDotWith, signalDotHieght);
            }
            
            circle.fillColor = tintColor.CGColor;
            
            animaton.beginTime = i*1.0+1.0;
            
            [circle addAnimation:animaton forKey:@"animationDoubleDotRotate"];
            
            [layer addSublayer:circle];
        }
        
    }else{
        
        signalDotWith = animationAreoWidth/3;
        signalDotHieght = animationAreoHeight/3;
        
        animaton = [self zy_createKeyFrameAnimationWithKeyPath:@"position"];
        animaton.values = @[[NSValue valueWithCGPoint:CGPointMake(0, 0)], [NSValue valueWithCGPoint:CGPointMake(animationAreoWidth-signalDotWith, 0)]];
        animaton.repeatCount = MAXFLOAT;
        animaton.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animaton.duration = 1.0f;
        animaton.autoreverses = YES;
        
        for (NSInteger i=0; i<2; i++) {
            
            animaton.beginTime = 1.0*i+0.5;
            
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, layer.frame.size.height/2-signalDotHieght/2, signalDotWith, signalDotHieght)];
            
            CAShapeLayer *dot = [CAShapeLayer layer];
            
            if (i == 0) {
                dot.fillColor = tintColor.CGColor;
            }else{
                dot.fillColor = [UIColor redColor].CGColor;
            }
            dot.path = path.CGPath;
            [layer addSublayer:dot];
            
            [dot addAnimation:animaton forKey:@"animationDoubleDotLine"];
        }

    }
    
}

@end
