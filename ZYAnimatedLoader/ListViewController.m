//
//  ListViewController.m
//  ZYAnimatedLoader
//
//  Created by macOfEthan on 17/12/28.
//  Copyright © 2017年 macOfEthan. All rights reserved.
//

#import "ListViewController.h"
#import "AnimatedViewController.h"

@interface ListViewController ()

@property (nonatomic, strong) NSArray *types;

@end

@implementation ListViewController

- (NSArray *)types
{
    if (!_types) {
        self.types = @[@"ZYAnimateTypeLineX",
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
                       ];
    }
    return _types;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.types.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reusedId = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reusedId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusedId];
    }
    
    cell.textLabel.text = self.types[indexPath.row];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimatedViewController *vc = [AnimatedViewController new];
    
    vc.type = indexPath.row;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


@end
