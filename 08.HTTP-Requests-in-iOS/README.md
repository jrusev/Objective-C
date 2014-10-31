## HTTP Requests in iOS

1. Create an abstraction for performing HTTP requests with Objective-C
    * It should support HTTP GET, POST, PUT and DELETE
    * Example:

        ```objective-c
        [httpRequester get: @"http://url.com" 
                  headers: headersDictionary
                withTarget: self
                    action: @selector(handleGet)]
        [httpRequester get: @"http://url.com" 
                withTarget: self
                    action: @selector(handleGet)]
        [httpRequester post: @"http://url.com" 
                       data: data
                 withTarget: self
                     action: @selector(handlePost)]
        ```

