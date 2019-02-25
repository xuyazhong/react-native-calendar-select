//
//  DatePicker.h
//  DatePicker
//
//  Created by xuyazhong on 2019/2/22.
//  Copyright © 2019年 xyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import "React/RCTEventEmitter.h"

@interface CalenderModule : NSObject<RCTBridgeModule>

@property (nonatomic, strong) NSDate *min;
@property (nonatomic, strong) NSDate *max;

@end
