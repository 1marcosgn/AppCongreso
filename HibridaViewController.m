//
//  HibridaViewController.m
//  AppCongreso
//
//  Created by Marcos Raúl García Nolasco on 06/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HibridaViewController.h"

@interface HibridaViewController ()

@end

@implementation HibridaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [scrollHibrido setScrollEnabled:YES];
    [scrollHibrido setContentSize:CGSizeMake(50, 680)];
    
    [scrollDecalogo setScrollEnabled:YES];
    [scrollDecalogo setContentSize:CGSizeMake(50, 1250)];
    
    [scrollObjetivos setScrollEnabled:YES];
    [scrollObjetivos setContentSize:CGSizeMake(50,480)];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
