//
//  RootViewController.h
//  AlarmApp
//
//  Created by hdk on 2014. 6. 26..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@class MainViewController;
@class SetupViewController;

@interface RootViewController : UIViewController {
    UIButton *_infoButton;
    
    MainViewController *_mainViewController; // 시계화면 컨트롤러
    
    SetupViewController *_setupViewController; // 설정화면 컨트롤러
}

@property (nonatomic, retain) IBOutlet  UIButton *infoButton;

@property (nonatomic, retain) MainViewController *mainViewController;

@property (nonatomic, retain) SetupViewController *_setupViewController;

- (IBAction)setupClick:(id)sender
- (void)alarmSetting;

@end
