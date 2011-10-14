//
//  AnimationController.h
//  AnimationModule
//
//  Created by 溪 陆 on 11-10-14.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnimationModuleDelegate <NSObject>
@required
-(void)animationModuleFinished;
@end


@interface AnimationController : NSObject {
    UIView *objectView_;
    CGPoint primaryPoint_;
    CGPoint aimPoint_;
    NSTimeInterval animationTime;
    NSTimeInterval delayTime;
    
    SEL animationFinishedSEL;
    
    id <AnimationModuleDelegate> delegate_;
}

@property (nonatomic, assign) id <AnimationModuleDelegate> delegate;

-(void)startAnimationModule;

-(void)setupViewImg:(UIView *)view
        PrimaryRect:(CGPoint)primaryRect
          aimToRect:(CGPoint)aimRect;
@end
