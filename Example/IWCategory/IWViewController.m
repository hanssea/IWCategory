//
//  IWViewController.m
//  IWCategory
//
//  Created by Hanssea on 11/29/2018.
//  Copyright (c) 2018 Hanssea. All rights reserved.
//

#import "IWViewController.h"
#import "IWCategoryHeader.h"
@interface IWViewController ()

@end

@implementation IWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSLog(@"1234567");
    
    
    NSLog(@"加盐后----  %@",[NSString MD5lower:@"1234567"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
