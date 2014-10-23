#import <Foundation/Foundation.h>

NSMutableString* createText() {
    NSMutableString *str = [[NSMutableString alloc] init];
    for (int i = 0; i < 10; i++) {
        [str appendString:@"Aaron is cool!\n"];
    }
    return str;
}

NSString* readFromFile(NSString *path) {
    NSError *err = nil;
    NSString *str = [[NSString alloc] initWithContentsOfFile:path
                                                    encoding:NSASCIIStringEncoding
                                                       error:&err];
    
    if (!str) {
        NSException *exception = [NSException
                                  exceptionWithName:@"ErrorReadingFile"
                                  reason:[err localizedDescription]
                                  userInfo:nil];
        
        // Throw the exception.
        @throw exception;
    }
    return str;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableString *text = createText();
        NSError *err = nil;
        NSString *path =@"/tmp/cool.txt";
        BOOL success = [text writeToFile:path
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&err];
        if (success) {
            NSLog(@"Done writing to '%@'", path);
            NSString *strFromFile = readFromFile(path);
            NSLog(@"'%@' looks like this: %@", path, strFromFile);
        } else {
            NSLog(@"Error writing: %@", [err localizedDescription]);
        }
    }
    return 0;
}
