//
//  AnimatedTransitioning.m
//  CustomTransition
//
//  Created by JMariano on 10/2/14.
//  Copyright (c) 2014 JMariano. All rights reserved.
//

#import "AnimatedTransitioning.h"
#import "TransitionData.h"

@implementation AnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    if (self.animateDismiss) {
        [container insertSubview:toViewController.view belowSubview:fromViewController.view];
    }
    else {
        toViewController.view.frame = [[TransitionData sharedInstance] touchedRect];
        [container addSubview:toViewController.view];
    }
    
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:0 animations:^{
        if (self.animateDismiss) {
             fromViewController.view.frame = [[TransitionData sharedInstance] touchedRect];
        }
        else {
            toViewController.view.frame = CGRectMake(0, 0, [[TransitionData sharedInstance] screenSize].width, [[TransitionData sharedInstance] screenSize].height);

        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

@end
