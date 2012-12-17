//
//  StatusViewController.h
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "QuizManager.h"
#import "EQAppDelegate.h"

@interface StatusViewController : UIViewController
{
    IBOutlet UILabel *myScore;
    IBOutlet UILabel *highestScore;
    IBOutlet UILabel *highestScoreUser;
}
@property (strong, nonatomic) QuizManager *quizManager;
@property (nonatomic, weak) EQAppDelegate *eqAppDelegate;

- (IBAction) showMyScore:(id)sender;
- (IBAction) showHighestScore:(id)sender;
- (IBAction) logout:(id)sender;
@end
