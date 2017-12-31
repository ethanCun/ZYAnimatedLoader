//
//  AnimatedViewController.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "AnimatedViewController.h"

@interface AnimatedViewController ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation AnimatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @[@"ZYAnimateTypeLineX",
                                  @"ZYAnimateTypeLineY",
                                  @"ZYAnimateTypeLineCenterY",
                                  @"ZYAnimateTypeDoubleDotScale",
                                  @"ZYAnimateTypeDoubleDotRotate",
                                  @"ZYAnimateTypeThreeDotLine",
                                  @"ZYAnimateTypeThreeDotRotate",
                                  @"ZYAnimateTypeNineDot",
                                  @"ZYAnimateTypeNineSquare",
                                  @"ZYAnimateTypeWaveBall",
                                  @"ZYAnimateTypeCircleRotate",
                                  @"ZYAnimateTypeCircleRipple",
                                  @"ZYAnimateTypeCircleBreathe"
                                  ][_type];
    
    ZYAnimator *animator = [[ZYAnimator alloc] initAnimateWithType:_type tintColor:[UIColor brownColor]];
    
    CGFloat w = 100;
    
    animator.frame = CGRectMake(CGRectGetWidth(self.view.bounds)/2-w/2, CGRectGetHeight(self.view.bounds)/2-w/2, w, w);
    
    animator.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:animator];
    
    [animator startAnimation];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        [animator stopAnimate];
        
//        [animator removeFromSuperview];
    });
}

@end
