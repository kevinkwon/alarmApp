//
//  RootViewController.m
//  AlarmApp
//
//  Created by hdk on 2014. 6. 26..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "SetupViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    // Do any additional setup after loading the view.
    
//    MainViewController *target = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
//    self.mainViewController = target;
//    [target release];
//    
//    [self.view insertSubview:self.mainViewController.view belowSubview:self.infoButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc
{
    [_infoButton release];
    [_mainViewController release];
    [_setupViewController release];
    
    [super dealloc];
}

#pragma mark - Publick Method
- (IBAction)setupClick:(id)sender // 화면 전환시 호출됩니다.
{
    NSLog(@"설정버튼 터치됨");
    if (!_setupViewController) {
        [self loadSetupViewController];
    }
    
    UIView *mainView = _mainViewController.view;
    UIView *setupView = _setupViewController.view;
    
    // 애니메이션 방법1
    [UIView beginAnimations:nil context:NULL]; // 애니메이션 시작
    [UIView setAnimationDuration:1.0f]; // 애니메이션 시간
    // 전환 효과
    [UIView setAnimationTransition:mainView.superview?UIViewAnimationTransitionFlipFromRight:UIViewAnimationTransitionFlipFromLeft
                           forView:self.view
                             cache:YES];
    // 메인뷰의 슈퍼뷰가 있는 경우 : 메인뷰를 보고 있는 경우
    if (!mainView.superview) {
        NSLog(@"a");
        [mainView removeFromSuperview];
        [_infoButton removeFromSuperview];
        [self.view addSubview:setupView];
    }
    // 셀정뷰의 슈퍼뷰가 있는 경우 : 설정뷰를 보고 있는 경우
    else {
        NSLog(@"b");
        [self alarmSetting];
        [setupView removeFromSuperview];
        [self.view addSubview:mainView];
        [self.view insertSubview:_infoButton aboveSubview:mainView];
    }
    [UIView commitAnimations];
    
/*
    // 애니메이션 방법2
    [UIView animateWithDuration:1.0f
                          delay:0.0f
                        options:mainView.superview?UIViewAnimationOptionTransitionFlipFromRight:UIViewAnimationOptionTransitionFlipFromLeft
                     animations:^{
                         // 메인뷰의 슈퍼뷰가 있는 경우 : 메인뷰를 보고 있는 경우
                         if (!mainView.superview) {
                             [mainView removeFromSuperview];
                             [_infoButton removeFromSuperview];
                             [self.view addSubview:setupView];
                         }
                         // 셀정뷰의 슈퍼뷰가 있는 경우 : 설정뷰를 보고 있는 경우
                         else {
                             [self alarmSetting];
                             [setupView removeFromSuperview];
                             [self.view addSubview:mainView];
                             [self.view insertSubview:_infoButton aboveSubview:mainView];
                         }
                     } completion:^(BOOL finished) {
                         nil;
                     }];
 */
}

- (void)alarmSetting // 알람 시간을 설정합니다.
{
    _mainViewController.pAlarmOnOff = _setupViewController.switchControl.on;
    
    if (_mainViewController.pAlarmOnOff) {
        NSCalendar *pCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        unsigned int unitFlags = NSYearCalendarUnit
                                | NSMonthCalendarUnit
                                | NSDayCalendarUnit
                                | NSHourCalendarUnit
                                | NSMinuteCalendarUnit
                                | NSSecondCalendarUnit;
        NSDate *date = [_setupViewController.pDatePicker date];
        NSDateComponents *comps = [pCalendar components:unitFlags fromDate:date];
        _mainViewController.pAlarmHour = (int)[comps hour];
        _mainViewController.pAlarmMinute = (int)[comps minute];
        [pCalendar release];
    }
}

#pragma mark - Private Method
- (void)loadSetupViewController {
    SetupViewController *target = [[SetupViewController alloc] initWithNibName:@"SetupViewController" bundle:nil];
    self.setupViewController = target;
    [target release];
}


@end
