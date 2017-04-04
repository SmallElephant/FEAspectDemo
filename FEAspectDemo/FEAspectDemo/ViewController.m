//
//  ViewController.m
//  FEAspectDemo
//
//  Created by keso on 2017/4/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "ViewController.h"
#import "Aspects.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self aspect_hookSelector:@selector(viewDidAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info) {
        NSLog(@"viewDidAppear执行完成之后的回调:%@",info);
    } error:nil];
    
    [self aspect_hookSelector:@selector(buyAction:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info,NSDictionary *dict){
        NSLog(@"购买的参数:%@",info.arguments);
    } error:nil];
    
    [self aspect_hookSelector:@selector(goBuy:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info,NSDictionary *dict){
        NSLog(@"参数:%@",info.arguments);
        NSLog(@"参数:%@",dict);
    } error:nil];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear---正常显示");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear---正常展示");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buyAction:(UIButton *)sender {
    NSDictionary *dict = @{@"productName":@"apple"};
    [self goBuy:dict];
}

- (void)goBuy:(NSDictionary *)dict {
    NSLog(@"购买开始啦");
}

@end
