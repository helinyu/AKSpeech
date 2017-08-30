//
//  AKSpeechMgr.h
//  AKSpeech
//
//  Created by Aka on 2017/8/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AKASpeechDefine.h"
@class AVSpeechSynthesizer;
@class AVSpeechSynthesisVoice;
@class AVSpeechUtterance;
@class AKSpeechModel;

@interface AKSpeechMgr : NSObject

+ (instancetype)shared;

typedef void(^AKSpeechTotalDelegateBlock)(AVSpeechSynthesizer *synthesizer, AVSpeechUtterance *utterance, NSRange characterRange, AKASpeechDelegateType type);
//typedef void(^SpeechNomalDelegateBlock)(AVSpeechSynthesizer *synthesizer, AVSpeechUtterance *utterance, AKASpeechDelegateType type);
//typedef void(^SpeechSimpleTotalDelegateBlock)(AVSpeechUtterance *utterance, NSRange characterRange, AKASpeechDelegateType type);
//typedef void(^SpeechSimpleNomalDelegateBlock)(AVSpeechUtterance *utterance, AKASpeechDelegateType type);

- (void)speechWithItem:(AKSpeechModel *)item complete:(AKSpeechTotalDelegateBlock)delegateBlock;

@end
