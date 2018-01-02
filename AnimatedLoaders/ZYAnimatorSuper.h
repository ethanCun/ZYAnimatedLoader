//
//  ZYAnimatorSuper.h
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZYAnimator.h"

@interface ZYAnimatorSuper : NSObject

/**初始化各种动画类型*/
- (CABasicAnimation *)zy_createBasicAnimationWithKeyPath:(NSString *)keyPath;

- (CAKeyframeAnimation *)zy_createKeyFrameAnimationWithKeyPath:(NSString *)keyPath;

- (CAAnimationGroup *)zy_createAnimationGrooup;

/**初始化动画公共方法*/
- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor keyPath:(NSString *)keyPath;
- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor type:(ZYAnimateType)type;
- (void)zy_setupLayer:(CALayer *)layer size:(CGSize)size tintColor:(UIColor *)tintColor keyPath:(NSString *)keyPath type:(ZYAnimateType)type;


@end
