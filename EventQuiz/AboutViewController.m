//
//  AboutViewController.m
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"About"];
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];    }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction) submit:(id)sender
{
    PFObject *f = [PFObject objectWithClassName:@"Feedback"];
    if([feedbackText text])
    {
        [f setObject:[feedbackText text] forKey:@"text"];
        [f setObject:[[PFUser currentUser] username] forKey:@"username"];
        [f saveInBackground];
    }
    [feedbackText setText:@"Thank you for the feedback!"];
}

@end
