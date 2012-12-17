//
//  QuizManager.m
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//


#import "QuizManager.h"
#import <Parse/Parse.h>

@implementation QuizManager
@synthesize score, questionsArr, /*userScoreObj,*/
lastFetchedDate, username, questionIndex;

- (id) init
{
    self = [super init];
    if (self)
    {
        [self setScore:[NSNumber numberWithInt:0]];
        [self setQuestionIndex:[NSNumber numberWithInt:-1]];
        PFUser *user = [PFUser currentUser];
        if(user)
        {
            [self setUsername:[user username]];
        }
        else
            [self setUsername:@""];
        
        /*userScoreObj = [PFObject objectWithClassName:@"UserScore"];
         [userScoreObj setObject:username forKey:@"username"];
         [userScoreObj setObject:[NSNumber numberWithInt:0] forKey:@"score"];
         [userScoreObj saveInBackground];*/
        
        [self loadAllQuestions];
        [self setLastFetchedDate:[NSDate date]];
        
    }
    return self;
}

- (void) loadAllQuestions
{
    PFQuery *query = [PFQuery queryWithClassName:@"QnA"];
    [query whereKey:@"byUser" notEqualTo:[self username]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error && objects)
        {
            questionsArr  = [[NSMutableArray alloc] initWithArray:objects];
            NSLog(@"Successfully retrieved %d scores.", questionsArr.count);
            [self setLastFetchedDate:[NSDate date]];
        }
    }];
}

- (void) loadUnfetchedQuestions
{
    PFQuery *query = [PFQuery queryWithClassName:@"QnA"];
    [query whereKey:@"byUser" notEqualTo:[self username]];
    [query whereKey:@"updatedAt" greaterThanOrEqualTo:lastFetchedDate];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error && objects)
        {
            [[self questionsArr] addObjectsFromArray:objects];
            // The find succeeded.
            NSLog(@"Successfully retrieved %d scores.", questionsArr.count);
            [self setLastFetchedDate:[NSDate date]];
        }
    }];
    
}

- (void) getNextQuestion:(UILabel *) q
                WithAns1:(UILabel*) ans1
                WithAns2:(UILabel*) ans2
                WithAns3:(UILabel*) ans3
                WithAns4:(UILabel*) ans4
{
    int idx = [questionIndex intValue] + 1;
    if(idx >= [questionsArr count])
    {
        [q setText: @""];
        [ans1 setText: @""];
        [ans2 setText: @""];
        [ans3 setText: @""];
        [ans4 setText: @""];
        return;
    }
    questionIndex = @(idx);
    PFObject *obj = [[self questionsArr] objectAtIndex:[questionIndex integerValue]];
    [q setText: [obj valueForKey:@"question"]];
    [ans1 setText:[obj valueForKey:@"ans1"]];
    [ans2 setText: [obj valueForKey:@"ans2"]];
    [ans3 setText: [obj valueForKey:@"ans3"]];
    [ans4 setText: [obj valueForKey:@"ans4"]];
}

- (void) recievedAnswerIdx: (NSNumber *) segIdx
{
    int idx = [questionIndex intValue] + 1;
    if(idx > [questionsArr count] || 0 == [questionsArr count])
        return;
    PFObject *obj = [[self questionsArr] objectAtIndex:[questionIndex integerValue]];
    int correctIdx = [[obj valueForKey:@"correctAnswer"] intValue];
    if([segIdx intValue] == correctIdx)
    {
        score = @([score intValue] +1);
        //[userScoreObj incrementKey:@"score"];
        PFObject *userScoreObj = [PFObject objectWithClassName:@"UserScore"];
        [userScoreObj setObject:username forKey:@"username"];
        [userScoreObj setObject:score forKey:@"score"];
        [userScoreObj saveInBackground];
    }
    [self loadUnfetchedQuestions];
}

- (void) skipQuestion
{
    int idx = [questionIndex intValue] + 1;
    if(idx > [questionsArr count] || 0 == [questionsArr count])
        return;
    PFObject *obj = [questionsArr objectAtIndex:[questionIndex integerValue]];
    [questionsArr addObject:obj];
    [questionsArr removeObjectAtIndex:[questionIndex intValue]];
    
}

- (void) setTopScoreString:(UILabel *) scoreLabel AndUser: (UILabel *) userLabel;
{
    PFQuery *query = [PFQuery queryWithClassName:@"UserScore"];
    
    // Retrieve the most recent ones
    [query orderByDescending:@"score"];
    
    // Only retrieve the last one
    query.limit = 1;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error && objects)
        {
            PFObject *obj = [objects objectAtIndex:0];
            [userLabel setText:[obj valueForKey:@"username"]];
            [scoreLabel setText:[[obj valueForKey:@"score"] description]];
        }
    }];
}


- (void) reset
{
    [self setScore:[NSNumber numberWithInt:0]];
    [self setQuestionIndex:[NSNumber numberWithInt:-1]];
    PFUser *user = [PFUser currentUser];
    if(user)
    {
        [self setUsername:[user username]];
    }
    else
        [self setUsername:@""];
}

@end
