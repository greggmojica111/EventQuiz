//
//  QuizViewController.m
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController
@synthesize quizManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Quiz"];
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [quizManager getNextQuestion:questionText
                        WithAns1:ans1Text
                        WithAns2:ans2Text
                        WithAns3:ans3Text
                        WithAns4:ans4Text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) submit:(id)sender
{
    [quizManager recievedAnswerIdx:[NSNumber numberWithInt:
                                    [segControl selectedSegmentIndex]]];
    [quizManager getNextQuestion:questionText
                        WithAns1:ans1Text
                        WithAns2:ans2Text
                        WithAns3:ans3Text
                        WithAns4:ans4Text];
    
}
- (IBAction) skip:(id)sender
{
    //[quizManager skipQuestion];
    [quizManager getNextQuestion:questionText
                        WithAns1:ans1Text
                        WithAns2:ans2Text
                        WithAns3:ans3Text
                        WithAns4:ans4Text];
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if([questionText isEqual:@""])
    {
        [quizManager getNextQuestion:questionText
                            WithAns1:ans1Text
                            WithAns2:ans2Text
                            WithAns3:ans3Text
                            WithAns4:ans4Text];
    }
}
@end
