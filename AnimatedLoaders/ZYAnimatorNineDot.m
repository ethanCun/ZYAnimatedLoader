//
//  ZYAnimatorNineDot.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorNineDot.h"

@implementation ZYAnimatorNineDot

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    CGFloat signalDotWith = animationAreoWidth/3-10;
    CGFloat signalDotHieght = animationAreoHeight/3-10;
    CGFloat space = 5;
    
    NSArray *colors = @[[UIColor redColor], [UIColor brownColor], [UIColor greenColor],[UIColor lightGrayColor], [UIColor yellowColor], [UIColor darkTextColor], [UIColor cyanColor], [UIColor groupTableViewBackgroundColor], [UIColor purpleColor]];
    
    #pragma mark - color
    CABasicAnimation *colorAnimation = [self zy_createBasicAnimationWithKeyPath:@"fillColor"];
    colorAnimation.repeatCount = MAXFLOAT;
    colorAnimation.duration = 1.0f;
    colorAnimation.autoreverses = YES;
   
    CABasicAnimation *scaleAnimation = [self zy_createBasicAnimationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithInteger:0.8];
    scaleAnimation.toValue = [NSNumber numberWithInteger:1.5];
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 1.0f;
    scaleAnimation.autoreverses = YES;
    
    NSInteger num = 0;
    for (NSInteger i=0; i<3; i++) {
        for (NSInteger j=0; j<3; j++) {
            
            colorAnimation.fromValue = (id)[colors[num] CGColor];
            colorAnimation.toValue = (id)[tintColor CGColor];
            
            CAAnimationGroup *group = [CAAnimationGroup animation];
            group.duration = 1.0f;
            group.repeatCount = MAXFLOAT;
            group.autoreverses = YES;
            group.animations = @[colorAnimation, scaleAnimation];
            
            //设置起始时间间隔
            colorAnimation.beginTime = num*0.1+0.1;
            group.beginTime = num*0.1+0.1;
            
            CAShapeLayer *dotLayer = [CAShapeLayer layer];
            dotLayer.fillColor = [colors[num] CGColor];
            dotLayer.frame = CGRectMake((signalDotWith+space)*j+space, (signalDotHieght+space)*i+space, signalDotWith, signalDotHieght);
            
            UIBezierPath *path;
            if (type == ZYAnimateTypeNineDot) {
                path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, signalDotWith, signalDotHieght)];
            }else{
                path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, signalDotWith, signalDotHieght)];
            }
            dotLayer.path = path.CGPath;
            
            [layer addSublayer:dotLayer];
            
            [dotLayer addAnimation:group forKey:@"animationNineDot"];
            
            num++;
        }
    }
    
}

@end
