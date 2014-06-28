//
//  SetupViewController.m
//  AlarmApp
//
//  Created by hdk on 2014. 6. 27..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import "SetupViewController.h"

@interface SetupViewController ()

@end

@implementation SetupViewController

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
    // Do any additional setup after loading the view from its nib.
    
    _pDatePicker.date = [NSDate date];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_pDatePicker release];
    [_switchControl release];
    [super dealloc];
}
@end
