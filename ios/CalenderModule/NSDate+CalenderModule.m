//
//  NSDate+CalenderModule.m
//  CalenderModule
//
//  Created by xuyazhong on 2019/2/25.
//  Copyright © 2019年 xyz. All rights reserved.
//

#import "NSDate+CalenderModule.h"

@implementation NSDate (CalenderModule)

- (NSDate *)last3month {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval time = 3 * 30 * (24 * 60 * 60);
    NSDate *newDate = [currentDate dateByAddingTimeInterval:-time];
    return newDate;
}

- (NSDate *)feture6month {
    NSDate *currentDate = [NSDate date];
    NSTimeInterval time = 6 * 30 * (24 * 60 * 60);
    NSDate *newDate = [currentDate dateByAddingTimeInterval:time];
    return newDate;
}

- (NSDate *)currentDate {
    return [NSDate date];
}


@end
