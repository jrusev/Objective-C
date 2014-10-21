#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//------------------------------------------------------------------------------
        NSURL *url = [NSURL URLWithString:
                      @"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *err = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&err];
        
        if (!data) {
            NSLog(@"fetch failed: %@", [err localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", [data length]);
        NSString *path = @"/tmp/google.png";
        BOOL written = [data writeToFile:path
                                 options:NSDataWritingAtomic
                                   error:&err];
        if (!written) {
            NSLog(@"write failed: %@", [err localizedDescription]);
            return 1;
        }
        
        NSLog(@"Success!");
        
        NSData *readData = [NSData dataWithContentsOfFile:path];
        NSLog(@"The file read from the disk has %lu bytes", readData.length);
        
    }
    return 0;
}
