//
//  EQAppDelegate.h
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizManager.h"
//#import "LoginViewController.h"

@interface EQAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) QuizManager *quizManager;
@property (strong, nonatomic) UITabBarController *tabBarController;
//@property (strong, nonatomic) LoginViewController *lgvc;

- (void) createViews;
- (void) loginSuccesful;
- (void) logout;

@end
