//
//  NSBundle+PGDatePicker.m
//
//  Created by piggybear on 2017/11/4.
//  Copyright © 2017年 piggybear. All rights reserved.
//

#import "NSBundle+PGDatePicker.h"
#import "PGDatePicker.h"

@implementation NSBundle (PGDatePicker)
+ (instancetype)safeBundle {
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[PGDatePicker class]] pathForResource:@"PGDatePicker" ofType:@"bundle"]];
    }
    return bundle;
}

+ (NSString *)pg_localizedStringForKey:(NSString *)key {
    return [self pg_localizedStringForKey:key value:nil];
}

+ (NSString *)pg_localizedStringForKey:(NSString *)key language:(NSString *)language {
    if (language == nil) {
        return [self pg_localizedStringForKey:key value:nil];
    }
    return [self pg_localizedStringForKey:key value:nil language:language];
}

+ (NSString *)pg_localizedStringForKey:(NSString *)key value:(NSString *)value {
    return [self pg_localizedStringForKey:key value:value language:@"zh-Hans"];
}

+ (NSString *)pg_localizedStringForKey:(NSString *)key value:(NSString *)value language:(NSString *)language {
    return [self localized:key];
}

+ (NSString *)localized:(NSString *)key {
    NSDictionary *dict = @{
                           @"yearString" : @"年",
                           @"monthString" : @"月",
                           @"dayString" : @"日",
                           @"hourString" : @"时",
                           @"minuteString" : @"分",
                           @"secondString" : @"秒",
                           @"mondayString" : @"周一",
                           @"tuesdayString" : @"周二",
                           @"wednesdayString" : @"周三",
                           @"thursdayString" : @"周四",
                           @"fridayString" : @"周五",
                           @"saturdayString" : @"周六",
                           @"sundayString" : @"周日",
                           @"cancelButtonText" : @"取消",
                           @"confirmButtonText" : @"确定"
                           };
    NSString *result = [dict objectForKey:key];
    return result ? result : key;
}
@end

