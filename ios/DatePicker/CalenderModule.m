//
//  DatePicker.m
//  DatePicker
//
//  Created by xuyazhong on 2019/2/22.
//  Copyright © 2019年 xyz. All rights reserved.
//

#import "CalenderModule.h"
#import "React/RCTBridge.h"
#import "React/RCTConvert.h"
#import "React/RCTEventDispatcher.h"

@implementation CalenderModule

RCT_EXPORT_MODULE()

- (UIViewController *)getRootVC {
    UIViewController *root = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    while (root.presentedViewController != nil) {
        root = root.presentedViewController;
    }
    return root;
}

RCT_EXPORT_METHOD(selectNormalDate:(NSString *)currentDate :(RCTResponseSenderBlock)callback) {
    NSLog(@"selectNormalDate");
    callback(@"2020-01-02");
}

RCT_EXPORT_METHOD(selectPastDatePicker:(NSString *)currentDate :(RCTResponseSenderBlock)callback) {
    NSLog(@"selectPastDatePicker");
    callback(@"2020-01-02");
}

RCT_EXPORT_METHOD(selectFeatureDatePicker:(NSString *)currentDate :(RCTResponseSenderBlock)callback) {
    NSLog(@"selectFeatureDatePicker");
    callback(@"2020-01-02");
}

@end

