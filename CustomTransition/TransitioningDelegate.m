//
//  TransitioningDelegate.m
//  CustomTransition
//
//  Created by JMariano on 10/2/14.
//  Copyright (c) 2014 JMariano. All rights reserved.
//

#import "TransitioningDelegate.h"
#import "AnimatedTransitioning.h"

@implementation TransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    AnimatedTransitioning *transitioning = [AnimatedTransitioning new];
    return transitioning;
}


- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    AnimatedTransitioning *transitioning = [AnimatedTransitioning new];
    transitioning.animateDismiss = YES;
    return transitioning;
}

@end
