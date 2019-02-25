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
#import "NSDate+CalenderModule.h"

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
    [self actionShowDatePicker:currentDate :NO :callback];
}

RCT_EXPORT_METHOD(selectPastDatePicker:(NSString *)currentDate :(RCTResponseSenderBlock)callback) {
    NSLog(@"selectPastDatePicker");
    self.min = [NSDate last3month];
    self.max = [NSDate currentDate];
    [self actionShowDatePicker:currentDate :YES :callback];
}

RCT_EXPORT_METHOD(selectFeatureDatePicker:(NSString *)currentDate :(RCTResponseSenderBlock)callback) {
    NSLog(@"selectFeatureDatePicker");
    self.min = [NSDate currentDate];
    self.max = [NSDate feture6month];
    [self actionShowDatePicker:currentDate :YES :callback];
}

- (void)actionShowDatePicker:(NSString *)currentDate :(BOOL)hasLimit :(RCTResponseSenderBlock)callback {
    PGDatePickManager *datePickManager = [[PGDatePickManager alloc]init];
    datePickManager.isShadeBackground = true;
    PGDatePicker *datePicker = datePickManager.datePicker;
    //    datePicker.delegate = self;
    datePicker.datePickerType = PGDatePickerTypeVertical;
    datePicker.isHiddenMiddleText = false;
    //    datePicker.isCycleScroll = true;
    datePicker.datePickerMode = PGDatePickerModeDate;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];

    if (hasLimit) {
        
        datePicker.minimumDate = self.min;
        datePicker.maximumDate = self.max;
    }
    NSDate *date = [dateFormatter dateFromString:currentDate];
    [datePicker setDate:date animated:true];
    
    datePicker.selectedDate = ^(NSDateComponents *dateComponents) {
        NSLog(@"dateComponents = %@", dateComponents);
        NSString *newDate = [NSString stringWithFormat:@"%@-%@-%@", dateComponents.year, dateComponents.month, dateComponents.day];
        callback(@[newDate]);
    };
    [[self getRootVC] presentViewController:datePickManager animated:false completion:nil];
    
}

@end

