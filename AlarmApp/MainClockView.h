//
//  MainClockView.h
//  AlarmApp
//
//  Created by hdk on 2014. 6. 27..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainClockView : UIView
{
    CGImageRef imgClock; // 이미지
    int _pHour;
    int _pMinute;
    int _pSecond;
}

- (void)drawLine:(CGContextRef)context;
- (void)drawClockBitmap:(CGContextRef)context;
- (void)drawSecond:(CGContextRef)context centerX:(int)pCenterX centerY:(int)centerY;
- (void)drawMinute:(CGContextRef)context centerX:(int)pCenterX centerY:(int)centerY;
- (void)drawHour:(CGContextRef)context centerX:(int)pCenterX centerY:(int)centerY;

@property int pHour; // (nonatomic, assign)  생략됨
@property int pMinute;
@property int pSecond;

@end
