//
//  ViewController.m
//  Quick Sort
//
//  Created by Daniel Fairbanks on 5/20/14.
//  Copyright (c) 2014 Fairbanksdan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSInteger pivotLocation;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSMutableArray *unsortedNumbersArray = [NSMutableArray new];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:8]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:1]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:20]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:21]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:13]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:10]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:29]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:6]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:2]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:26]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:18]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:3]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:4]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:14]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:11]];
    [unsortedNumbersArray addObject:[NSNumber numberWithInteger:22]];
    
    NSLog(@" %@", unsortedNumbersArray);
    
     [self quickSortArray:unsortedNumbersArray withLow:0 andHigh:unsortedNumbersArray.count - 1];
}

-(void)quickSortArray:(NSMutableArray *)array withLow:(NSInteger)low andHigh:(NSInteger)high
{
    if (low < high)
    {
        self.pivotLocation = [self partitionArray:array withLow:low andHigh:high];
        
        [self quickSortArray:array withLow:low andHigh:self.pivotLocation - 1];
        
        [self quickSortArray:array withLow:self.pivotLocation +1 andHigh:high];
    }
    
}

-(NSInteger)partitionArray:(NSMutableArray *)array withLow:(NSInteger)low andHigh:(NSInteger)high
{
    
    int pivotValue = [array[low] intValue];
    int leftWall = low;
    
    for (int i = low; i <= high;i++) //this for loop gets every value less than the pivot value to the left of our leftwall
    {
        if ([array[i] intValue] < pivotValue)
        {
            leftWall++; //counting how many values are less than our pivotValue
            
            [array exchangeObjectAtIndex:i withObjectAtIndex:leftWall]; //Switches out the value at i for the value at leftWall, this way when we do the final exchange after this for loop, leftwall is the pivot (since it switched with low) and low is the final smaller value that was exchanged in the for loop
        }
    }
    
    [array exchangeObjectAtIndex:low withObjectAtIndex:leftWall];
    
    NSLog(@"%d",leftWall);
    
    return leftWall;
}

@end
