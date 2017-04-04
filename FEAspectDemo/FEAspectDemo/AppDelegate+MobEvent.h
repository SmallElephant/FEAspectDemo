//
//  AppDelegate+MobEvent.h
//  FEAspectDemo
//
//  Created by keso on 2017/4/4.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import "AppDelegate.h"

static NSString * const MobEventClassName = @"MobEventClassName";

static NSString * const MobEventClassDescription = @"MobEventClassDescription";

static NSString * const MobEventClassEvents = @"MobEventClassEvents";

static NSString * const MobEventClassEventName = @"MobEventClassEventName";
static NSString * const MobEventSelectorName = @"MobEventSelectorName";
static NSString * const MobEventSelectorBlock = @"MobEventSelectorBlock";

@interface AppDelegate (MobEvent)

- (void)setupAnalytics:(NSDictionary *)configs;

@end
