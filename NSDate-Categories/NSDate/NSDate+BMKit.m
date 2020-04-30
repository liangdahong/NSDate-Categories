//
//  NSDate+BMKit.m
//
//  Created by liangdahong on 2020/3/1.
//  Copyright © 2020 月亮小屋（中国）有限公司. All rights reserved.
//

#import "NSDate+BMKit.h"

#define _BM_va_start_va_end_date_BMKIT \
    NSMutableString *format = (format1 ? format1 : @"").mutableCopy;\
    va_list args;\
    va_start(args, format1);\
    int index = 0;\
    id arg = nil;\
    while ((arg = va_arg(args, NSString *))) {\
        [format appendString:arg];\
        index ++;\
    }\
    va_end(args);\

@implementation NSDate (BMKit)

- (NSDate *)bm_todayStartDate {
    NSString *format = @"yyyy-MM-dd 000000";
    return [NSDate bm_dateWithString:[self bm_stringWithFormat:format] format:format];
}

- (NSDate *)bm_todayEndtDate {
    NSTimeInterval time = self.bm_todayStartDate.timeIntervalSince1970;
    return [NSDate bm_dateWithSecondTimeStamp:time + (24*3600 - 1)];
}

+ (instancetype)bm_dateWithSecondTimeStamp:(NSTimeInterval)t {
    return [NSDate dateWithTimeIntervalSince1970:t];
}

+ (instancetype)bm_dateWithMillisecondTimeStamp:(NSTimeInterval)t {
    return [NSDate bm_dateWithSecondTimeStamp:t/1000];
}

+ (instancetype)bm_dateWithString:(NSString *)str format:(NSDateFormatKey)format {
    NSDateFormatter *custom = [[NSDateFormatter alloc] init];
    [custom setDateFormat:format];
    return [custom dateFromString:str];
}

+ (instancetype)bm_dateWithString:(NSString *)str formats:(NSDateFormatKey)format1, ... {
    _BM_va_start_va_end_date_BMKIT
    return [self bm_dateWithString:str format:format];
}

- (NSString *)bm_stringWithFormat:(NSDateFormatKey)format {
    NSDateFormatter *custom = [[NSDateFormatter alloc] init];
    [custom setDateFormat:format];
    return  [custom stringFromDate:self];
}

- (NSString *)bm_stringWithFormats:(NSDateFormatKey)format1, ... {
    _BM_va_start_va_end_date_BMKIT
    return [self bm_stringWithFormat:format];
}

+ (NSString *)bm_stringWithSecondTimeStamp:(NSTimeInterval)t format:(NSDateFormatKey)format{
    return [[self bm_dateWithSecondTimeStamp:t] bm_stringWithFormat:format];
}

+ (NSString *)bm_stringWithMillisecondTimeStamp:(NSTimeInterval)t format:(NSDateFormatKey)format {
    return [[self bm_dateWithMillisecondTimeStamp:t] bm_stringWithFormat:format];
}

+ (NSString *)bm_stringWithMillisecondTimeStamp:(NSTimeInterval)t formats:(NSDateFormatKey)format1, ... {
    _BM_va_start_va_end_date_BMKIT
    return [self bm_stringWithMillisecondTimeStamp:t format:format];
}

@end
