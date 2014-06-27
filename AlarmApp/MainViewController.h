//
//  MainViewController.h
//  AlarmApp
//
//  Created by hdk on 2014. 6. 27..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainClockView.h"

@interface MainViewController : UIViewController {
    NSTimer *timer;
    
    IBOutlet UILabel *clockDisplay; // 디지털 시계
    IBOutlet MainClockView *pClockView; // 아날로그 시계
    
    BOOL pAlarmOnOff; // 알람 설정 여부
    int pAlarmHour, pAlarmMinute; // 알람 시간, (시, 분)
}

- (void)onTimer; // 타이머 이벤트 핸들러
- (void)messageDisplay; // 알람 떄 호출되는 함수, 화면에 메시지 출력

@property (nonatomic, assign) BOOL pAlarmOnOff;
@property (nonatomic, assign) int pAlarmHour;
@property (nonatomic, assign) int pAlarmMinute;

@end
