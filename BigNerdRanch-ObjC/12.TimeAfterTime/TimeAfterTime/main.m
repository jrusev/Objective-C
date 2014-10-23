//
//  main.m
//  TimeAfterTime
//
//  Created by JR on 10/17/14.
//
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Find how many hours you have lived
        NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1977];
        [comps setMonth:6];
        [comps setDay:9];
        
        NSDate *dateOfBirth = [cal dateFromComponents:comps];
        NSDate *now = [NSDate date];
        
        double interval = [now timeIntervalSinceDate:dateOfBirth];
        NSLog(@"The interval is %f days", interval/3600/24);
        
        // Shows the time zone and daylight saving time
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSLog(@"Time zone: %@", zone);
        bool isDayLight = [zone isDaylightSavingTime];
        NSLog(@"Is daylight: %@", isDayLight ? @"YES" : @"NO");
        
        // Get the current computer host name
        NSHost *host = [NSHost currentHost];
        NSString *hostName = [host localizedName];
        NSLog(@"This computer hostname is '%@'", hostName);
        
        NSString *str = @"Mac - Admin";
        if ([hostName isEqualToString:str])
            NSLog(@"'%@' and '%@' are equal", hostName, str);
    }
    return 0;
}