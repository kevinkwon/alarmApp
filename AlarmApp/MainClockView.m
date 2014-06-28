//
//  MainClockView.m
//  AlarmApp
//
//  Created by hdk on 2014. 6. 27..
//  Copyright (c) 2014년 Kevin Kwon. All rights reserved.
//

#import "MainClockView.h"

const int SECOND_WIDTH = 80;
const int MINUTE_WIDTH = 70;
const int HOUR_WIDTH = 60;

@implementation MainClockView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIImage *img = [UIImage imageNamed:@"clock.png"]; // 시계이미지를 불러온다.
        imgClock = CGImageRetain(img.CGImage);
        [img release];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // 현재뷰의 그래픽 컨텍스트를 구합니다.
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawClockBitmap:context]; // 시계 이미지를 화면에 출력합니다.
    [self drawLine:context]; // 시, 분, 초를 화면으로 출력합니다.
}

- (void)drawLine:(CGContextRef)context
{
    // int centerX = self.bounds.size.width / 2; // 아래같이 고쳐 쓸수 있다.
    // int centerY = self.bounds.size.height / 2; // 아래같이 고쳐 쓸수 있다.
    int centerX = CGRectGetMidX(self.bounds);
    int centerY = CGRectGetMidY(self.bounds);
    
    [self drawSecond:context centerX:centerX centerY:centerY]; // 촛침을 그린다.
    [self drawMinute:context centerX:centerX centerY:centerY]; // 분침을 그린다.
    [self drawHour:context centerX:centerX centerY:centerY]; // 시침을 그린다.
}

- (void)drawSecond:(CGContextRef)context centerX:(int)pCenterX centerY:(int)centerY
{
    // 현재의 초에 해당하는 좌표를 구합니다.
    int newX, newY;
    // 초침의 끝점 좌표를 구한다.
    newX = (int)(sin(_pSecond * 6 * 3.14 / 180) * SECOND_WIDTH + pCenterX);
    newY = (int)(centerY - (cos(_pSecond * 6 * 3.14 / 180) * SECOND_WIDTH));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0f); // 색지정
    CGContextSetLineWidth(context, 2.0); // 선 굵기
    CGContextMoveToPoint(context, pCenterX, centerY); // 선의 시작점 지정
    CGContextAddLineToPoint(context, newX, newY); // 선의 끝점 지정
    CGContextStrokePath(context); // 선 그리기
}

- (void)drawMinute:(CGContextRef)context centerX:(int)pCenterX centerY:(int)centerY
{
    // 현재의 초에 해당하는 좌표를 구합니다.
    int newX, newY;
    // 분침의 끝점 좌표를 구한다.
    newX = (int)(sin(_pMinute * 6 * 3.14 / 180) * MINUTE_WIDTH + pCenterX);
    newY = (int)(centerY - (cos(_pMinute * 6 * 3.14 / 180) * MINUTE_WIDTH));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0f); // 색지정
    CGContextSetLineWidth(context, 3.0); // 선 굵기
    CGContextMoveToPoint(context, pCenterX, centerY); // 선의 시작점 지정
    CGContextAddLineToPoint(context, newX, newY); // 선의 끝점 지정
    CGContextStrokePath(context); // 선 그리기
}

- (void)drawHour:(CGContextRef)context centerX:(int)pCenterX centerY:(int)centerY
{
    // 현재의 초에 해당하는 좌표를 구합니다.
    int newX, newY;
    // 분침의 끝점 좌표를 구한다.
    newX = (int)(sin(_pHour * 30 * 3.14 / 180) * HOUR_WIDTH + pCenterX);
    newY = (int)(centerY - (cos(_pHour * 30 * 3.14 / 180) * HOUR_WIDTH));
    
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0f); // 색지정
    CGContextSetLineWidth(context, 4.0); // 선 굵기
    CGContextMoveToPoint(context, pCenterX, centerY); // 선의 시작점 지정
    CGContextAddLineToPoint(context, newX, newY); // 선의 끝점 지정
    CGContextStrokePath(context); // 선 그리기
}

- (void)drawClockBitmap:(CGContextRef)context
{
    CGContextSaveGState(context); //CTM의 이전상태를 저장
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height); // 좌표의 원점을 이동
    CGContextScaleCTM(context, 1.0, -1.0); // 좌표계의 비율을 바꿉니다.
    CGContextClipToRect(context, CGRectMake(0
                                            , 0
                                            , CGRectGetWidth(self.bounds)
                                            , CGRectGetHeight(self.bounds)));
    CGContextDrawImage(context, CGRectMake(0
                                           , 0
                                           , CGImageGetWidth(imgClock)
                                           , CGImageGetHeight(imgClock))
                       , imgClock);
    CGContextRestoreGState(context); // CTM이전 상태를 복구합니다.
    
                        
    
}

@end
