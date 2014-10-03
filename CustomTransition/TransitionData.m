//
//  TransitionData.m
//  CustomTransition
//
//  Created by JMariano on 10/3/14.
//  Copyright (c) 2014 JMariano. All rights reserved.
//

#import "TransitionData.h"

@implementation TransitionData
+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}

-(CGSize)screenSize {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect.size;
}
@end
