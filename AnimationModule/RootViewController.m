//
//  RootViewController.m
//  AnimationModule
//
//  Created by 溪 陆 on 11-10-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "AnimationController.h"

@implementation RootViewController

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 100, 40);
    [button addTarget:self action:@selector(starAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)starAnimation {


    [self performSelectorOnMainThread:@selector(animationStart:) withObject:nil waitUntilDone:NO];
}

-(void)animationStart:(id)objects{
    UIView *object = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    object.backgroundColor = [UIColor redColor];
    [self.view addSubview:object];

    AnimationController *animManager = [[AnimationController alloc] init];
    [animManager setDelegate:self];
    [animManager setupViewImg:object PrimaryRect:CGPointMake(150, 150) aimToRect:CGPointMake(300, 300)];
    [animManager startAnimationModule];
}

-(void)animationModuleFinished {
    NSLog(@"结束");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
