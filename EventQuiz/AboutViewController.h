//
//  AboutViewController.h
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AboutViewController : UIViewController
<UITextFieldDelegate>
{
    IBOutlet UITextField *feedbackText;
}
- (IBAction) submit:(id)sender;
@end
