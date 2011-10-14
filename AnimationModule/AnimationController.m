//
//  AnimationController.m
//  AnimationModule
//
//  Created by 溪 陆 on 11-10-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "AnimationController.h"

@interface AnimationController()

-(void)moveAnimationTo:(CGPoint)point 
         animationTime:(NSTimeInterval)animTime;

-(void)emergeAnimation:(NSTimeInterval)animTime;


-(void)endingAnimation:(NSTimeInterval)animTime;
@end


@implementation AnimationController
@synthesize delegate = delegate_;

- (id)init
{
    self = [super init];
    if (self) {
        delegate_ = nil;
        objectView_ = nil;
        animationFinishedSEL = nil;
    }
    
    return self;
}

-(void)setupViewImg:(UIView *)view 
        PrimaryRect:(CGPoint)primaryRect
          aimToRect:(CGPoint)aimRect 
{
    primaryPoint_ = primaryRect;
    aimPoint_ = aimRect;
    objectView_ = view;
}

-(void)startAnimationModule {
    [self emergeAnimation:0.3];
}

-(void)emergeAnimation:(NSTimeInterval)animTime {
    [UIView animateWithDuration:animTime 
                     animations:^{
                         objectView_.transform = CGAffineTransformScale(objectView_.transform, 0.5, 0.5);
                     }
                     completion:^(BOOL finished) {
                         [self moveAnimationTo:CGPointMake(primaryPoint_.x, primaryPoint_.y) animationTime:0.8];
                     }];
}

-(void)moveAnimationTo:(CGPoint)point animationTime:(NSTimeInterval)animTime {
    [UIView animateWithDuration:animTime 
                     animations:^{
                         objectView_.transform = CGAffineTransformMakeTranslation(point.x, point.y); 
                     }
                     completion:^(BOOL finished) {
                         [self endingAnimation:0.2];
                     }];
}

-(void)endingAnimation:(NSTimeInterval)animTime {
    [UIView animateWithDuration:animTime 
                     animations:^{
                         objectView_.transform = CGAffineTransformScale(objectView_.transform, 1.3, 1.3);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.3
                                          animations:^{
                                                objectView_.transform = CGAffineTransformScale(objectView_.transform, 0.1, 0.1);
                                          }
                                          completion:^(BOOL finished){
                                              [objectView_ removeFromSuperview];
                                              [delegate_ animationModuleFinished];
                                          }];
                     }];
}


-(void)dealloc {
    delegate_ = nil;
    [super dealloc];
}
@end
