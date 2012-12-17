//
//  QuizViewController.h
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizManager.h"

@interface QuizViewController : UIViewController
{
    IBOutlet UILabel *questionText;
    IBOutlet UILabel *ans1Text;
    IBOutlet UILabel *ans2Text;
    IBOutlet UILabel *ans3Text;
    IBOutlet UILabel *ans4Text;
    IBOutlet UISegmentedControl *segControl;
}
@property (strong, nonatomic) QuizManager *quizManager;

- (IBAction) submit:(id)sender;
- (IBAction) skip:(id)sender;

@end
