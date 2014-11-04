//
//  main.m
//  HttpRequester
//
//  Created by JR on 11/4/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequester.h"
#import "HttpReceiver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *url = @"https://maps.googleapis.com/maps/api/place/search/json";
        HttpRequester *requester = [[HttpRequester alloc] init];
        HttpReceiver *receiver = [[HttpReceiver alloc] init];
        
        [requester httpGet:url headers:nil target:receiver];
        
        // Create a loop until we get the data back
        while (!receiver.data) {
            NSDate *futureTime = [NSDate dateWithTimeIntervalSinceNow:0.1];
            [[NSRunLoop currentRunLoop] runUntilDate:futureTime];
        }
        
        NSString* response = [[NSString alloc] initWithData:receiver.data encoding:NSUTF8StringEncoding];
        NSLog(@"Response received: %@", response);
    }
    return 0;
}
