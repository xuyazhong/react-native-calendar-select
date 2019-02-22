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
#import "PGDatePickManager.h"

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
//    callback(@"2020-01-02");
    [self actionShowDatePicker:currentDate :callback];
}

RCT_EXPORT_METHOD(selectPastDatePicker:(NSString *)currentDate :(RCTResponseSenderBlock)callback) {
    NSLog(@"selectPastDatePicker");
//    callback(@"2020-01-02");
    [self actionShowDatePicker:currentDate :callback];
}

RCT_EXPORT_METHOD(selectFeatureDatePicker:(NSString *)currentDate :(RCTResponseSenderBlock)callback) {
    NSLog(@"selectFeatureDatePicker");
//    callback(@"2020-01-02");
    [self actionShowDatePicker:currentDate :callback];
}

- (void)actionShowDatePicker:(NSString *)currentDate :(RCTResponseSenderBlock)callback {
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    datePickManager.isShadeBackground = true;
    PGDatePicker *datePicker = datePickManager.datePicker;
    //    datePicker.delegate = self;
    datePicker.datePickerType = PGDatePickerTypeVertical;
    datePicker.isHiddenMiddleText = false;
    //    datePicker.isCycleScroll = true;
    datePicker.datePickerMode = PGDatePickerModeDate;

    datePicker.selectedDate = ^(NSDateComponents *dateComponents) {
        NSLog(@"dateComponents = %@", dateComponents);
        callback(@[@"2020-01-02"]);
    };
    [[self getRootVC] presentViewController:datePickManager animated:false completion:nil];
    
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //    dateFormatter.dateFormat = @"yyyy-MM-dd";
    
    //    datePicker.minimumDate = [dateFormatter dateFromString: @"2018-02-18"];
    //    datePicker.maximumDate = [dateFormatter dateFromString: @"2020-01-18"];
    
    //    NSDate *date = [dateFormatter dateFromString: @"2019-01-18"];
    //    [datePicker setDate:date animated:true];
}

@end

