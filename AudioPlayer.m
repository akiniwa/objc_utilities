//
//  AudioPlayer.m
//  Pract
//
//  Created by s_akiba on 12/08/01.
//  Copyright (c) 2012年 早稲田大学. All rights reserved.
//

#import "AudioPlayer.h"

static id theSharedManager = nil;

@implementation AudioPlayer
{
    AVAudioPlayer *player;
}

@synthesize audioCurrentTime, musicTitle;

+ (id)sharedManager
{
    if (theSharedManager == nil)
    {
        theSharedManager = [[self alloc] init];
    }
    return theSharedManager;
}

- (BOOL)isPlaying
{
    return (player.rate > 0);
}

- (void)playAudioWithData:(NSData *)soundData
{
        if (player)
        {
            [player pause];
        }
        player = [[AVAudioPlayer alloc] initWithData:soundData error:nil];
}

- (NSTimeInterval) audioCurrentTime {
    return player.currentTime;
}

- (void) audioTime{
    player.currentTime = 0;
}

- (void)initing:(NSData*)soundData {
    player = [[AVAudioPlayer alloc] initWithData:soundData error:nil];
}

- (void)play
{
    if (player)
    {
        [player play];
    }
}

- (void)pause
{
    if (player)
    {
        [player pause];
        NSNotification* notification;
        notification = [NSNotification notificationWithName:@"notificate" 
                                                     object:self userInfo:nil];
        // NSNotificationCenterを取得する
        NSNotificationCenter* center;
        center = [NSNotificationCenter defaultCenter];
        // 通知を行う
        [center postNotification:notification];
    }
}

@end