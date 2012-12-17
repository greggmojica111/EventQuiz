//
//  EQAppDelegate.m
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import "EQAppDelegate.h"
#import "PostQuestionViewController.h"
#import "LoginViewController.h"
#import "AboutViewController.h"
#import "QuizViewController.h"
#import "StatusViewController.h"
#import <Parse/Parse.h>

@implementation EQAppDelegate
@synthesize tabBarController, quizManager;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"CowBcvza653yEGEqCxMgpaP4czypyasWD4vrdYZk"
                  clientKey:@"qJNpZrRjJh9MrqbH48XZRxxH333vPeesopf6KTPY"];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    LoginViewController *lgvc = [[LoginViewController alloc] init];
    [lgvc setEqAppDelegate:self];
    
    [[self window] setRootViewController:lgvc];
    [self createViews];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) createViews
{
    quizManager = [[QuizManager alloc]init];
    
    AboutViewController *aboutvc = [[AboutViewController alloc] init];
    
    QuizViewController *quizcv = [[QuizViewController alloc] init];
    [quizcv setQuizManager:quizManager];
    
    PostQuestionViewController *postvc = [[PostQuestionViewController alloc] init];
    
    StatusViewController *statusvc = [[StatusViewController alloc] init];
    [statusvc setQuizManager:quizManager];
    [statusvc setEqAppDelegate:self];
    
    tabBarController = [[UITabBarController alloc]init];
    NSArray *viewControllers = [NSArray arrayWithObjects:
                                aboutvc, quizcv, postvc,statusvc, nil];
    
    [tabBarController setViewControllers:viewControllers];
    //[[self window] setRootViewController:tabBarController];
    
    [self.window makeKeyAndVisible];
}

- (void) loginSuccesful
{
    [quizManager reset];
    
    [[self window] setRootViewController:tabBarController];
    [self.window makeKeyAndVisible];
}

- (void) logout
{
    LoginViewController *lgvc = [[LoginViewController alloc] init];
    [lgvc setEqAppDelegate:self];
    [tabBarController setSelectedIndex:0];
    
    [[self window] setRootViewController:lgvc];
    
    [self.window makeKeyAndVisible];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
