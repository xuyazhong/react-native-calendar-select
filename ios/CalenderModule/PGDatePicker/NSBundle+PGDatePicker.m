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
    NSString *language = [NSLocale preferredLanguages].firstObject;
    language = @"zh-Hans";
    return [self pg_localizedStringForKey:key value:value language:language];
}

+ (NSString *)pg_localizedStringForKey:(NSString *)key value:(NSString *)value language:(NSString *)language {
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle safeBundle] pathForResource:language ofType:@"lproj"]];
    value = [bundle localizedStringForKey:key value:value table:nil];
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}
@end
