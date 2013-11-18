//
//  ProblemSetViewController.m
//  ProblemSet1
//
//  Created by Stefan Dierauf on 11/17/13.
//  Copyright (c) 2013 Stefan Dierauf. All rights reserved.
//

#import "ProblemSetViewController.h"

@interface ProblemSetViewController ()
@property (weak, nonatomic) IBOutlet UITextView *console;

@end

@implementation ProblemSetViewController
- (IBAction)doProblem1 {
    [self appendTextToConsole:@"Finding the sum of all the multiples of 3 and 5 below 1000...\n"];
    int sum = 0;
    for (int i = 1; i < 1000; i++) {
        if (i % 3 == 0) {
            sum += i;
        } else if (i % 5 == 0) {
            sum += i;
        }
    }
    //The sum of all multiples of 3 and 5 below 1000 is: sum
    [self appendTextToConsole:[NSString stringWithFormat:@"The sum of all multiples of 3 and 5 below 1000 is: %d\n", sum]];
}
- (IBAction)doProblem2 {
    [self appendTextToConsole:@"Finding the sum of all even fibbonaci numbers below 4,000,000...\n"];
    int max = 4000000;
    int sum = 0;
    int fib = 0;
    int a = 0;
    int b = 1;
    while (fib < max) {
        if (a < b) {
            a = a + b;
            fib = a;
        } else {
            b = a + b;
            fib = b;
        }
        if (fib % 2 == 0) {
            sum += fib;
        }
    }
    [self appendTextToConsole:[NSString stringWithFormat:@"The sum of all even fibbonaci numbers below 4,000,000 is: %d\n", sum]];
}
- (IBAction)doProblem3 {
    [self appendTextToConsole:@"lol fuck problem 3\n"];
}
- (IBAction)doProblem4 {
    [self appendTextToConsole:@"Finding the largest palindrome made from multiplying two 3 digit numbers...\n"];
    int largest = 0;
    for (int i = 100; i < 1000; i++) {
        for (int j = 100; j < 1000; j++) {
            int product = i * j;
            if ([self isPalindrome:[NSString stringWithFormat:@"%d", product]]) {
                if (product > largest) {
                    largest = product;
                }
            }
        }
    }
    [self appendTextToConsole:[NSString stringWithFormat:@"The largest palindrome made from multiplying two 3 digit numbers is: %d\n", largest]];
}
- (IBAction)doProblem5 {
    [self appendTextToConsole:@"Finding the smallest number divisible by the numbers from 1 to 20 without a remainder...\n"];
    int max = 20;
    int answer = max;
    while (![self hasRemainder:answer withMaxDivisor:max]) {
        answer += 20;
    }
    [self appendTextToConsole:[NSString stringWithFormat:@"The smallest number divisible by the numbers from 1 to 20 is: %d\n", answer]];
}

- (BOOL)hasRemainder:(int)num withMaxDivisor:(int)maximum {
    for (int i = 2; i < maximum; i++) {
        if (num % i != 0) {
            return false;
        }
    }
    return true;
}
- (IBAction)runAllProblems {
    [self appendTextToConsole:@"Running all problems and measuring time elapsed...\n-----\n"];
    NSDate *date = [NSDate date];
    [self doProblem1];
    [self doProblem2];
    [self doProblem3];
    [self doProblem4];
    [self doProblem5];
    double timePassed_ms = [date timeIntervalSinceNow] * -1000.0;
    [self appendTextToConsole:[NSString stringWithFormat:@"-------\nCompleted with out error\nTime elapsed: %fms", timePassed_ms]];
    
}

- (BOOL)isPalindrome:(NSString*)p {
    
    NSInteger length = p.length;
    NSInteger halfLength = (length / 2);
    
    BOOL isPalindrome = YES;
    
    for (int i = 0; i < halfLength; i++) {
        if ([p characterAtIndex:i] != [p characterAtIndex:length - i - 1]) {
            isPalindrome = NO;
            break;
        }
    }
    return isPalindrome;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)appendTextToConsole:(NSString*)text
{
    NSAttributedString * bootyLord = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat: @"%@\n", text]];
    [self.console.textStorage appendAttributedString:bootyLord];
}

@end
