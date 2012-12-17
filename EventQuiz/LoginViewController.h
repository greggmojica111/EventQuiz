//
//  LoginViewController.h
//  PQ_ver1
//
//  Created by Yael Weinberg on 12/8/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "EQAppDelegate.h"

@interface LoginViewController : UIViewController
<UITextFieldDelegate>
{
    IBOutlet UITextField *username;
    IBOutlet UITextField *password;
    IBOutlet UISegmentedControl *segControl;
}
@property (nonatomic, weak) EQAppDelegate *eqAppDelegate;
@end
