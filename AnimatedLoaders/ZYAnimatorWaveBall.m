//
//  ZYAnimatorWaveBall.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorWaveBall.h"

@interface ZYAnimatorWaveBall ()
{
    CGFloat _speed;
    
    /**设置振幅*/
    CGFloat _waveA;
    /**周期*/
    CGFloat _waveW;
    /**偏移*/
    CGFloat _waveOffsetX;
    /**在Y轴位置*/
    CGFloat _waveY;
    
    CGFloat _waveB;
    CGFloat _waveWB;
    CGFloat _waveOffsetXB;
    CGFloat _waveYB;
    
    CALayer *_layer;
    UIColor *_tintColor;
    CGSize _size;
    ZYAnimateType _type;
    
    CAShapeLayer *_waveLayerA;
    CAShapeLayer *_waveLayerB;
}

@property (nonatomic, strong) CADisplayLink *displayLink;


@end

@implementation ZYAnimatorWaveBall

- (CADisplayLink *)displayLink
{
    if (!_displayLink) {
        
        CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChanged:)];
        self.displayLink = displayLink;
    }
    return _displayLink;
}

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    
    _speed = 0.2;
    
    _waveA = 10;
    _waveW = 1/(3*M_PI);
    _waveOffsetX = M_PI;
    _waveY = animationAreoHeight-30;
    
    _waveB = 10;
    _waveWB = 1/(3*M_PI);
    _waveOffsetXB = 0;
    _waveYB = animationAreoHeight-30;
    
    _layer = layer;
    _size = size;
    _tintColor = tintColor;
    _type = type;

    //背景
    UIBezierPath *ballPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, animationAreoWidth, animationAreoHeight)];
    
    CAShapeLayer *ballLayer = [CAShapeLayer layer];
    ballLayer.frame = CGRectMake(0, 0, animationAreoWidth, animationAreoHeight);
    ballLayer.fillColor = [UIColor clearColor].CGColor;
    ballLayer.lineWidth = 1;
    ballLayer.strokeColor = tintColor.CGColor;
    ballLayer.path = ballPath.CGPath;
    ballLayer.cornerRadius = MIN(animationAreoWidth/2, animationAreoHeight/2);
    ballLayer.masksToBounds = YES;
    [layer addSublayer:ballLayer];
    
    for (NSInteger i=0; i<2; i++) {
        
        CAShapeLayer *waveLayer = [CAShapeLayer layer];
        [ballLayer addSublayer:waveLayer];
        
        if (i == 0) {
            _waveLayerA = waveLayer;
            _waveLayerA.fillColor = _tintColor.CGColor;

        }else{
            _waveLayerB = waveLayer;
            _waveLayerB.fillColor = [UIColor blueColor].CGColor;
        }
        
    }
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)timeChanged:(CADisplayLink *)displayLink
{
    CGFloat animationAreoWidth = _layer.frame.size.width;
    CGFloat animationAreoHeight = _layer.frame.size.height;
    
    _waveOffsetX += _speed;
    _waveOffsetXB += _speed;

    
    UIBezierPath *pathA = [UIBezierPath bezierPath];
    UIBezierPath *pathB = [UIBezierPath bezierPath];

    CGFloat yA = _waveY;
    CGFloat yB = _waveY;

    [pathA moveToPoint:CGPointMake(0, yA)];
    [pathB moveToPoint:CGPointMake(0, yB)];

    for (NSInteger i=0; i<animationAreoWidth; i++) {
        
        yA = _waveA * sin(_waveW*i+_waveOffsetX)+_waveY;
        yB = _waveB * sin(_waveWB*i+_waveOffsetXB)+_waveYB;

        [pathA addLineToPoint:CGPointMake(i, yA)];
        [pathB addLineToPoint:CGPointMake(i, yB)];
    }
    
    [pathA addLineToPoint:CGPointMake(animationAreoWidth, animationAreoHeight)];
    [pathA addLineToPoint:CGPointMake(0, animationAreoHeight)];
    [pathA closePath];
    [pathB addLineToPoint:CGPointMake(animationAreoWidth, animationAreoHeight)];
    [pathB addLineToPoint:CGPointMake(0, animationAreoHeight)];
    [pathB closePath];
    
    _waveLayerA.path = pathA.CGPath;
    _waveLayerB.path = pathB.CGPath;

    [pathA removeAllPoints];
    [pathB removeAllPoints];
}

- (void)stopDisplayLink
{
    [_displayLink invalidate];
    _displayLink = nil;
}


@end
