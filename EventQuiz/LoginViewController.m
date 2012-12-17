//
//  LoginViewController.m
//  PQ_ver1
//
//  Created by Yael Weinberg on 12/8/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize eqAppDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Login"];
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    return self;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger selIdx = [segControl selectedSegmentIndex];
    NSString * title = [segControl titleForSegmentAtIndex:selIdx];
    if([title isEqualToString:@"Sign Up"])
    {
        PFUser *user = [PFUser user];
        user.username = [username text];
        user.password = [password text];
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                NSString *errorString = [[error userInfo] objectForKey:@"error"];
                NSLog(@"%@",errorString);
            }
            else
            {
                [eqAppDelegate loginSuccesful];
            }
        }];
    }
    else if([title isEqualToString:@"Log In"])
    {
        NSError *__autoreleasing *err = NULL;
        [PFUser logInWithUsername:[username text]
                         password:[password text]
                            error:err];
        if(!err)
        {
            [eqAppDelegate loginSuccesful];
        }
    }
    [textField resignFirstResponder];
    return YES;
}
@end
