//
//  Appliance.h
//  Applicances
//
//  Created by JR on 10/24/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appliance : NSObject

@property (copy) NSString *productName;
@property int voltage;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)prodName;

@end
