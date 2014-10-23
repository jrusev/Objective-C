//
//  Blender.h
//  Constants
//
//  Created by JR on 10/20/14.
//  Copyright (c) 2014 JR. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    BlenderSpeedStir,
    BlenderSpeedChop,
    BlenderSpeedPulse
} BlenderSpeed;

@interface Blender : NSObject

@property BlenderSpeed speed;

@end
