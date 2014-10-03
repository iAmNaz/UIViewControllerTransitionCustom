//
//  ViewController.m
//  CustomTransition
//
//  Created by JMariano on 10/2/14.
//  Copyright (c) 2014 JMariano. All rights reserved.
//

#import "ViewController.h"
#import "TransitionData.h"
#import "DetailViewController.h"
#import "TransitioningDelegate.h"


@interface ViewController ()<UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) TransitioningDelegate *tdelegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tdelegate =  [TransitioningDelegate new];
    self.transitioningDelegate = _tdelegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIColor* cellColor = [UIColor colorWithHue:drand48() saturation:1.0 brightness:1.0 alpha:1.0];
    cell.contentView.backgroundColor = cellColor;
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [[TransitionData sharedInstance] setTouchedRect:[self.view convertRect:cell.frame fromView:collectionView]];
    DetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    vc.transitioningDelegate = self.transitioningDelegate;
    [self presentViewController:vc animated:YES completion:nil];
}


@end
