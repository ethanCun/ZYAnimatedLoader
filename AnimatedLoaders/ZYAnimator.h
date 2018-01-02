//
//  ZYAnimator.h
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZYAnimateType)
{
    ZYAnimateTypeLineX = 0,
    ZYAnimateTypeLineY,
    ZYAnimateTypeLineCenterY,
    ZYAnimateTypeDoubleDotScale,
    ZYAnimateTypeDoubleDotRotate,
    ZYAnimateTypeThreeDotLine,
    ZYAnimateTypeThreeDotRotate,
    ZYAnimateTypeNineDot,
    ZYAnimateTypeNineSquare,
    ZYAnimateTypeWaveBall,
    ZYAnimateTypeCircleRotate,
    ZYAnimateTypeCircleRipple,
    ZYAnimateTypeCircleBreathe,
    ZYAnimateTypeCircleDot,
    ZYAnimateTypeCirclePie
};

@interface ZYAnimator : UIView


/**大小区域 默认宽高都是40*/
@property (nonatomic, assign) CGSize size;

/**动画颜色*/
@property (nonatomic, strong) UIColor *tintColor;

/**背景颜色*/
@property (nonatomic, strong) UIColor *backgroundColor;


/**初始化*/
- (id)initAnimateWithType:(ZYAnimateType)type;
- (id)initAnimateWithType:(ZYAnimateType)type tintColor:(UIColor *)tintColor;

/**开始动画*/
- (void)startAnimation;

/**结束动画*/
- (void)stopAnimate;

@end
