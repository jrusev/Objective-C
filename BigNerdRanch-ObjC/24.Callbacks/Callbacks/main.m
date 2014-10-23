#import <Foundation/Foundation.h>
#import "Logger.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Logger *logger = [[Logger alloc] init];
        
        [[NSNotificationCenter defaultCenter]
         addObserver:logger
         selector:@selector(zoneChange:)
         name:NSSystemTimeZoneDidChangeNotification
         object:nil];
        
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        
        __unused NSURLConnection *conn = [[NSURLConnection alloc]
                                          initWithRequest:req
                                          delegate:logger
                                          startImmediately:YES];
        
        __unused NSTimer *timer = [NSTimer
                                   scheduledTimerWithTimeInterval:2
                                                           target:logger
                                                         selector:@selector(sayOuch:)
                                                         userInfo:nil
                                                          repeats:YES];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
