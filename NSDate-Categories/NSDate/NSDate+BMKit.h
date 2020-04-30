//
//  NSDate+BMKit.h
//
//  Created by liangdahong on 2020/3/1.
//  Copyright © 2020 月亮小屋（中国）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
https://developer.apple.com/documentation/foundation/dateformatter
https://stackoverflow.com/questions/35700281/date-format-in-swift
https://blog.csdn.net/u011423056/article/details/80136288
https://blog.csdn.net/hamasn/article/details/8966377
 G:    公元时代，例如AD公元
 yy:   年的后2位
 yyyy: 完整年
 MM:   月，显示为1-12
 MMM:  月，显示为英文月份简写,如 Jan
 MMMM: 月，显示为英文月份全称，如 Janualy
 dd:   日，2位数表示，如02
 d:    日，1-2位显示，如 2
 EEE:  简写星期几，如Sun
 EEEE: 全写星期几，如Sunday
 aa:   上下午，AM/PM
 H:    时，24小时制，0-23
 K：   时，12小时制，0-11
 m:    分，1-2位
 mm:   分，2位
 s:    秒，1-2位
 ss:   秒，2位
 S：   毫秒
 */

#define kYYYY @"yyyy"
#define kMM   @"MM"
#define kDD   @"dd"
#define kHH   @"HH"
#define kmm   @"mm"
#define kss   @"ss"

#define kYYYYMMDDHHmmss @"yyyy-MM-dd HH:mm:ss"
#define kYYYYMMDDHHmm   @"yyyy-MM-dd HH:mm"
#define kYYYYMMDDHH     @"yyyy-MM-dd HH"
#define kYYYYMMDD       @"yyyy-MM-dd"
#define kYYYYMM         @"yyyy-MM"
#define kMMDD           @"MM-dd"

#define kYYYY_MM_DDHHmmss @"yyyy.MM.dd"

// ↑↑↑
typedef NSString * NSDateFormatKey NS_STRING_ENUM;

@interface NSDate (BMKit)

@property (nonatomic, strong, readonly) NSDate *bm_todayStartDate; ///< 获取时间的在当天的开始时间
@property (nonatomic, strong, readonly) NSDate *bm_todayEndtDate; ///< 获取时间的在当天的结束时间

///< 时间戳秒 -> NSDate
+ (instancetype)bm_dateWithSecondTimeStamp:(NSTimeInterval)timeInterval;
///< 时间戳毫秒 -> NSDate
+ (instancetype)bm_dateWithMillisecondTimeStamp:(NSTimeInterval)t;
///< 时间2020-03-12  -> NSDate
+ (instancetype)bm_dateWithString:(NSString *)str format:(NSDateFormatKey)format;
/// 时间2020-03-12  -> NSDate
/// @param str @"2020-03-12"
/// @param format1 format1 [xxx xxxxgWithFormats:@"yyyy",@"-MM",@"-dd", nil] == [xxx xxxWithFormat:@"yyyy-MM-dd"]
+ (instancetype)bm_dateWithString:(NSString *)str formats:(NSDateFormatKey)format1, ... NS_REQUIRES_NIL_TERMINATION;

///< self -> 2020-03-12
- (NSString *)bm_stringWithFormat:(NSDateFormatKey)format;
/// self -> 2020-03-12
/// @param format1 format1 [xxx xxxxgWithFormats:@"yyyy",@"-MM",@"-dd", nil] == [xxx xxxWithFormat:@"yyyy-MM-dd"]
- (NSString *)bm_stringWithFormats:(NSDateFormatKey)format1, ... NS_REQUIRES_NIL_TERMINATION;

/// 时间戳秒 -> 2020-03-12
+ (NSString *)bm_stringWithSecondTimeStamp:(NSTimeInterval)t format:(NSDateFormatKey)format;
/// 时间戳毫秒 -> 2020-03-12
+ (NSString *)bm_stringWithMillisecondTimeStamp:(NSTimeInterval)t format:(NSDateFormatKey)format;
/// 时间戳毫秒 -> 2020-03-12
/// @param t 时间戳毫秒
/// @param format1 [xxx xxxxgWithFormats:@"yyyy",@"-MM",@"-dd", nil] == [xxx xxxWithFormat:@"yyyy-MM-dd"]
+ (NSString *)bm_stringWithMillisecondTimeStamp:(NSTimeInterval)t formats:(NSDateFormatKey)format1, ... NS_REQUIRES_NIL_TERMINATION;

@end

NS_ASSUME_NONNULL_END
