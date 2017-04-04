//
//  AppDelegate+MobEvent.m
//  FEAspectDemo
//
//  Created by keso on 2017/4/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "AppDelegate+MobEvent.h"
#import "Aspects.h"

typedef void (^AspectHandlerBlock)(id<AspectInfo> aspectInfo);

@implementation AppDelegate (MobEvent)

- (void)setupAnalytics:(NSDictionary *)configs {
    // Hook Page Impression

    
    // Hook Events
    for (NSString *className in configs) {
        Class clazz = NSClassFromString(className);
        NSDictionary *config = configs[className];
        
        if (config[MobEventClassEvents]) {
            for (NSDictionary *event in config[MobEventClassEvents]) {
                SEL selekor = NSSelectorFromString(event[MobEventSelectorName]);
                AspectHandlerBlock block = event[MobEventSelectorBlock];
                
                [clazz aspect_hookSelector:selekor
                               withOptions:AspectPositionAfter
                                usingBlock:^(id<AspectInfo> aspectInfo) {
                                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                                        block(aspectInfo);
                                    });
                                } error:NULL];
                
            }
        }
    }
}

@end
