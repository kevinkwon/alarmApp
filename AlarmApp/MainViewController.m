//
//  MainViewController.m
//  AlarmApp
//
//  Created by hdk on 2014. 6. 27..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    
    pAlarmHour = NO;
    
    [self onTimer];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
    // 현재 시간을 뷰에 표현할 폰트
    [clockDisplay setFont:[UIFont fontWithName:@"DBLCDTempBlack" size:64.0f]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onTimer {
    int pHour, pMinute, pSecond;
    
    NSCalendar *pCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    unsigned int unitFlag = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;

    NSDate *date = [NSDate date]; // 현재시간 구함
    NSDateComponents *comps = [pCalendar components:unitFlag fromDate:date];
    pHour = [comps hour]; // 현재시간 시
    pMinute = [comps minute]; // 현재시간 분
    pSecond = [comps second]; // 현재시간 초
    clockDisplay.text = [NSString stringWithFormat:@"%02d:%02d:%02d", pHour, pMinute, pSecond];
    
    pClockView.pHour = pHour;
    pClockView.pMinute = pMinute;
    pClockView.pSecond = pSecond;
    
    [pClockView setNeedsDisplay]; // 아나로그 시계뷰를 다시 그립니다.
    
    if (pAlarmOnOff) {
        if (pAlarmHour == pHour && pAlarmMinute == pMinute && pSecond == 0) {
            [self messageDisplay];
        }
    }
    [pCalendar release];
}

- (void)messageDisplay
{
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"알람시계"
                                                      message:@"약속시간입니다."
                                                     delegate:self
                                            cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alerView show];
    [alerView release];
}
@end
