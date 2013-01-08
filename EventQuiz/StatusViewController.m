//
//  StatusViewController.m
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//


#import "StatusViewController.h"
#import "QuizManager.h"

@interface StatusViewController ()

@end

@implementation StatusViewController
@synthesize quizManager;
@synthesize eqAppDelegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Status"];
        UIImage *i = [UIImage imageNamed:@"Purple.png"];
        [tbi setImage:i];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) showMyScore:(id)sender
{
    [myScore setText:[[quizManager score] description]];
}

- (IBAction) showHighestScore:(id)sender
{
    [quizManager setTopScoreString:highestScore AndUser:highestScoreUser];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self showHighestScore:self];
    [self showMyScore:self];
}

- (IBAction) logout:(id)sender
{
    //Log out current user and then tell the App Delegate to return to Login view
    [PFUser logOut];
    [eqAppDelegate logout];
}

@end
