//
//  ZYAnimatorCircleDot.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 18/1/2.
//  Copyright © 2018年 macOfEthan. All rights reserved.
//

#import "ZYAnimatorCircleDot.h"

static const NSInteger frames = 15;

@interface ZYAnimatorCircleDot ()

@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, assign) CGSize size;

@end

@implementation ZYAnimatorCircleDot

- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [NSMutableArray array];
        
        for (NSInteger i=0; i<15; i++) {
            
            [self.images addObject:[self createImageWithFrameIndex:i]];
        }
    }
    return _images;
}

- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type
{
    _tintColor = tintColor;
    _size = size;
    
    CGFloat animationAreoWidth = layer.frame.size.width;
    CGFloat animationAreoHeight = layer.frame.size.height;
    
    //转化为CGImage
    NSMutableArray *cgImages = [NSMutableArray new];
    for (UIImage *image in self.images) {
        
        [cgImages addObject:(__bridge id _Nullable)image.CGImage];
    }
    
    CAKeyframeAnimation *circleBallAnimation = [self zy_createKeyFrameAnimationWithKeyPath:@"contents"];
    circleBallAnimation.values = cgImages;
    circleBallAnimation.duration = 1.0f;
    circleBallAnimation.repeatCount = HUGE_VAL;
    circleBallAnimation.removedOnCompletion = NO;
    
    CAShapeLayer *ballLayer = [CAShapeLayer layer];
    ballLayer.frame = CGRectMake(0, 0, animationAreoWidth, animationAreoHeight);
    ballLayer.contents = (__bridge id _Nullable)([self.images.firstObject CGImage]);
    ballLayer.fillColor = _tintColor.CGColor;
    [ballLayer addAnimation:circleBallAnimation forKey:@"ballAnimation"];

    [layer addSublayer:ballLayer];
}

- (UIImage *)createImageWithFrameIndex:(NSInteger)frameIndex
{
    //内直径
    CGFloat innerRadius = _size.width/3;
    //小球直径
    CGFloat ballRadius = 2;
    //总直径
    CGFloat totalRadius = innerRadius+ballRadius;

    //起始透明度
    CGFloat startAlpha = 50.0f/255.0f;
    CGFloat endAlpha = 240.0f/255.0f;
    
    //图片大小区域
    CGFloat imageSize = ceilf(innerRadius*2+ballRadius*2);
    
    //总变化范围
    CGFloat semiAmplitude = ((endAlpha-startAlpha) * 0.5f);
    CGFloat alphaAxis = (startAlpha + semiAmplitude);
    
    //第frameIndex的角度
    CGFloat frameAngle = (((CGFloat)frameIndex / (CGFloat)frames) * 2 *M_PI);
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageSize, imageSize), NO, 2.0f);
    
    for (NSInteger ballIndex = 0; ballIndex<frames; ballIndex++) {
        
        //当前小球的角度
        CGFloat radius =2*M_PI*ballIndex/frames;
        
        //剩余透明度
        CGFloat alphaAngle = (((CGFloat)(frames - ballIndex) / (CGFloat)frames) * 2 * M_PI);
        
        //小球的亮度
        CGFloat alpha = alphaAxis + (sinf(frameAngle + alphaAngle) * semiAmplitude);
        
        //小球的中点位置
        CGPoint ballCenter = CGPointMake(totalRadius+innerRadius*cosf(radius), totalRadius+innerRadius*sinf(radius));
        
        //绘制小球
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(ballCenter.x-ballRadius, ballCenter.y-ballRadius, ballRadius*2, ballRadius*2)];
        
        //填充颜色
        [[_tintColor colorWithAlphaComponent:alpha] setFill];
        
        //闭合
        [path fill];
    }
    
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return finalImage;
}




@end
