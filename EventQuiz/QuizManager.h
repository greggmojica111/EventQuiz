//
//  QuizManager.h
//  EventQuiz
//
//  Created by Yael Weinberg on 12/16/12.
//  Copyright (c) 2012 Yael Weinberg. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <Parse/Parse.h>

@interface QuizManager : NSObject
@property NSNumber *score;
@property NSMutableArray *questionsArr;
@property NSNumber *questionIndex;
@property NSDate *lastFetchedDate;
@property NSString *username;
//@property PFObject *userScoreObj;

- (void) loadAllQuestions;
- (void) loadUnfetchedQuestions;
- (void) getNextQuestion:(UILabel *) q
                WithAns1:(UILabel*) ans1
                WithAns2:(UILabel*) ans2
                WithAns3:(UILabel*) ans3
                WithAns4:(UILabel*) ans4;
- (void) recievedAnswerIdx: (NSNumber *) idx;
- (void) skipQuestion;
- (void) setTopScoreString:(UILabel *) scoreLabel AndUser: (UILabel *) userLabel;
- (void) reset;

@end
