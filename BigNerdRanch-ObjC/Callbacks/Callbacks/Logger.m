#import "Logger.h"

@implementation Logger

- (void)sayOuch:(NSTimer *)t {
    NSLog(@"Ouch!");
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    
    NSLog(@"received %lu bytes", data.length);
    if (!incomingData) {
        incomingData = [[NSMutableData alloc] init];
    }
    
    [incomingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Got it all!");
    
    NSString *str = [[NSString alloc] initWithData:incomingData
                                          encoding:NSUTF8StringEncoding];
    incomingData = nil;
    NSLog(@"string has %lu characters", str.length);
    
    // Uncomment the next line to print the string
    // NSLog(@"The whole string is %@", str);
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    NSLog(@"connection failed: %@", [error localizedDescription]);
    incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed1");
}

@end
