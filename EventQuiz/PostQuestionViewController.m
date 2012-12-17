//
//  PostQuestionViewController.m
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import "PostQuestionViewController.h"

@interface PostQuestionViewController ()

@end

@implementation PostQuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Post Question"];
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void) saveAnswer: (NSString *)text
        ForQuestion: (NSString *) qId
           WithFlag: (BOOL) isCorrect
{
    PFObject *a = [PFObject objectWithClassName:@"Answer"];
    [a setObject:text forKey:@"text"];
    [a setObject:qId forKey:@"questionId"];
    [a setObject:[NSNumber numberWithBool:isCorrect] forKey:@"isCorrect"];
    [a saveInBackground];
}

- (IBAction) post:(id)sender
{
    /*PFObject *q = [PFObject objectWithClassName:@"Question"];
     [q setObject:[questionText text] forKey:@"text"];
     //Saving the question will be done in background.
     //When the data is saved, the question's objectId can be used
     //by the answers objects.
     [q saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
     NSInteger correctAns = [segControl selectedSegmentIndex];
     
     [self saveAnswer: [ans1Text text]
     ForQuestion: [q objectId]
     WithFlag: (correctAns == 0)];
     [self saveAnswer: [ans2Text text]
     ForQuestion: [q objectId]
     WithFlag: (correctAns == 1)];
     [self saveAnswer: [ans3Text text]
     ForQuestion: [q objectId]
     WithFlag: (correctAns == 2)];
     [self saveAnswer: [ans4Text text]
     ForQuestion: [q objectId]
     WithFlag: (correctAns == 3)];
     }];*/
    
    //Other queries will require fetching the entire data per question
    PFUser *currentUser = [PFUser currentUser];
    NSString *userName = @"";
    if(currentUser)
        userName = [currentUser username];
    PFObject *qa = [PFObject objectWithClassName:@"QnA"];
    [qa setObject:[questionText text] forKey:@"question"];
    [qa setObject:[ans1Text text] forKey:@"ans1"];
    [qa setObject:[ans2Text text] forKey:@"ans2"];
    [qa setObject:[ans3Text text] forKey:@"ans3"];
    [qa setObject:[ans4Text text] forKey:@"ans4"];
    [qa setObject:[NSNumber numberWithInt:[segControl selectedSegmentIndex]] forKey:@"correctAnswer"];
    [qa setObject:userName forKey:@"byUser"];
    [qa saveInBackground];
    [self clear:self];
}
- (IBAction) clear:(id)sender
{
    [questionText setText:@""];
    [ans1Text setText:@""];
    [ans2Text setText:@""];
    [ans3Text setText:@""];
    [ans4Text setText:@""];
    [segControl setSelectedSegmentIndex:0];
}
@end
