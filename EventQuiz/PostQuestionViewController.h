//
//  PostQuestionViewController.h
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface PostQuestionViewController : UIViewController
<UITextFieldDelegate>
{
    IBOutlet UITextField *questionText;
    IBOutlet UITextField *ans1Text;
    IBOutlet UITextField *ans2Text;
    IBOutlet UITextField *ans3Text;
    IBOutlet UITextField *ans4Text;
    IBOutlet UISegmentedControl *segControl;
}
- (IBAction) post:(id)sender;
- (IBAction) clear:(id)sender;
- (void) saveAnswer: (NSString *)text
        ForQuestion: (NSString *) qId
           WithFlag: (BOOL) isCorrect;

@end
