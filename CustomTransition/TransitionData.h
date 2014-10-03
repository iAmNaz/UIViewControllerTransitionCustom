//
//  TransitionData.h
//  CustomTransition
//
//  Created by JMariano on 10/3/14.
//  Copyright (c) 2014 JMariano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TransitionData : NSObject
+ (id)sharedInstance;
@property (assign)CGRect touchedRect;
-(CGSize)screenSize;
@end
