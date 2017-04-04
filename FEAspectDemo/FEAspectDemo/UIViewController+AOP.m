//
//  UIViewController+AOP.m
//  FEAspectDemo
//
//  Created by keso on 2017/4/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "UIViewController+AOP.h"
#import <objc/runtime.h>


@implementation UIViewController (AOP)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [obj swizzleMethod:@selector(viewWillAppear:) withMethod:@selector(aop_viewWillAppear:)];
        [obj swizzleMethod:@selector(viewDidAppear:) withMethod:@selector(aop_viewDidAppear:)];
    });
}

- (void)aop_viewWillAppear:(BOOL)animated {
    NSLog(@"FlyElephant--aop_viewWillAppear方法执行");
}

- (void)aop_viewDidAppear:(BOOL)test {
     NSLog(@"FlyElephant--aop_viewDidAppear方法执行");
}

- (void)swizzleMethod:(SEL)origSelector withMethod:(SEL)newSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, origSelector);
    Method swizzledMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        origSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


@end
