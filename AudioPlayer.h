//
//  AudioPlayer.h
//  Pract
//
//  Created by s_akiba on 12/08/01.
//  Copyright (c) 2012年 早稲田大学. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol AudioPlayerDelegate;

@interface AudioPlayer : NSObject

//@property (nonatomic, assign, readonly) BOOL isPlaying;
@property NSTimeInterval audioCurrentTime;
@property (nonatomic, retain) NSString *musicTitle;

+ (id)sharedManager;

- (void)playAudioWithData:(NSData *)soundData;
- (void)play;
- (void)pause;
- (NSTimeInterval)audioCurrentTime;
- (void)audioTime;
- (BOOL)isPlaying;

@end