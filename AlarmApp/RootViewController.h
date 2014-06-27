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
    UIButton *infoButton;

// 생략가능
//    IBOutlet UIButton *_infoButton;
//    
//    MainViewController *_mainViewController; // 시계화면 컨트롤러
//    
//    SetupViewController *_setupViewController; // 설정화면 컨트롤러
    
}

@property (nonatomic, retain) IBOutlet UIButton *infoButton;

@property (nonatomic, retain) MainViewController *mainViewController;

@property (nonatomic, retain) SetupViewController *setupViewController;

- (IBAction)setupClick:(id)sender; // 화면 전환시 호출됩니다.

- (void)alarmSetting; // 알람 시간을 설정합니다.

@end
