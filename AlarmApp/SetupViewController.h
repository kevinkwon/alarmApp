//
//  SetupViewController.h
//  AlarmApp
//
//  Created by hdk on 2014. 6. 27..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetupViewController : UIViewController
{
    IBOutlet UIDatePicker *pDatePicker;

    IBOutlet UISwitch *switchControl;
}

@property (retain, nonatomic) IBOutlet UIDatePicker *pDatePicker;

@property (retain, nonatomic) IBOutlet UISwitch *switchControl;

@end
