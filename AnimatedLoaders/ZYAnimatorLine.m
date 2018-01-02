//
//  ZYAnimatorLine.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorLine.h"
#import <UIKit/UIKit.h>

@implementation ZYAnimatorLine

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor keyPath:(NSString *)keyPath
{
    [self zy_setupLayer:layer size:size tintColor:tintColor keyPath:keyPath type:0];
}

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor keyPath:(NSString *)keyPath type:(ZYAnimateType)type
{
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    CGFloat signalLineWith = animationAreoWidth/10;
    CGFloat signalLineHieght = animationAreoHeight;
    
    CGFloat x = 0;
    CGFloat y = signalLineHieght/2;
    
    CAKeyframeAnimation *animation = [self zy_createKeyFrameAnimationWithKeyPath:keyPath];
    
    //变化规律
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 1.0f;
    animation.repeatCount = MAXFLOAT;
    
    animation.keyTimes = @[@0.0f, @0.5f, @1.0f];
    
    /**控制动画值 y方向的比例*/
    animation.values = @[@0.5, @0, @1.0f];
    
    /**设置了removedOnCompletion = NO 那么直到你手动移除他, 要不永远不会释放, 所以释放的话要手动调用*/
    animation.removedOnCompletion = NO;
    
    //设置动画往复
    animation.autoreverses = YES;
    
    //动画起始时间
    NSArray *beginTimes = @[@0.1, @0.2, @0.3, @0.4, @0.5];
    
    for (NSInteger i=0; i<beginTimes.count; i++) {
        
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        
        /**设置每个线条的动画起始时间*/
        animation.beginTime = [beginTimes[i] floatValue];
        
        //设置线条波动规律
        UIBezierPath *path;
        
        if (type == ZYAnimateTypeLineCenterY) {
            
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, signalLineWith, signalLineHieght) cornerRadius:size.width/20];
            lineLayer.frame = CGRectMake(x+signalLineWith*2*i, 0, signalLineWith, signalLineHieght);
        }else{
            
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, -y,signalLineWith, signalLineHieght) cornerRadius:size.width/20];
            lineLayer.frame = CGRectMake(x+signalLineWith*2*i, y, signalLineWith, signalLineHieght);
        }
        
        lineLayer.path = path.CGPath;
        lineLayer.fillColor = tintColor.CGColor;
        
        [layer addSublayer:lineLayer];
        
        [lineLayer addAnimation:animation forKey:@"animationLine"];
        
    }
}

@end
