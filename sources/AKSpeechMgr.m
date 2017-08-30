//
//  AKSpeechMgr.m
//  AKSpeech
//
//  Created by Aka on 2017/8/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import "AKSpeechMgr.h"
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import "AKSpeechModel.h"

@interface AKSpeechMgr ()<AVSpeechSynthesizerDelegate>

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong) AVSpeechUtterance *utterance;
@property (nonatomic, strong) AVSpeechSynthesisVoice *voice;

@property (nonatomic, copy) AKSpeechTotalDelegateBlock deleegateBlock;

@end

@implementation AKSpeechMgr

+ (instancetype)shared {
    static id singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initBase];
    }
    return self;
}

- (void)initBase {
    _synthesizer = [AVSpeechSynthesizer new];
    _synthesizer.delegate = self;
    _utterance = [AVSpeechUtterance new];
    _voice = [AVSpeechSynthesisVoice new];
}

- (void)speechWithItem:(AKSpeechModel *)item complete:(AKSpeechTotalDelegateBlock)delegateBlock{
    _voice = [self _speechSynthesisVoiceWithItem:item];
    _utterance = [self _configureUtteranceWithItem:item voice:_voice];
    [_synthesizer speakUtterance:_utterance];
    if (delegateBlock) {
        _deleegateBlock = delegateBlock;
    }else{
        NSLog(@"block 不存在");
    }
}

#pragma mark -- private methods

- (AVSpeechSynthesisVoice *)_speechSynthesisVoiceWithItem:(AKSpeechModel *)item {
    AVSpeechSynthesisVoice *voice;
    if (item.language.length <= 0) {
        NSAssert(voice, @"创建AVSpeechSynthesisVoice 对象是吧，请输入设备支持的语言或者标示符");
        return nil;
    }
    voice = [AVSpeechSynthesisVoice voiceWithLanguage:item.language];
    if (!voice) {
        if (item.identifier.length <= 0) {
            NSAssert(voice, @"创建AVSpeechSynthesisVoice 对象是吧，请输入设备支持的语言或者标示符");
            return nil;
        }else{
            voice = [AVSpeechSynthesisVoice voiceWithIdentifier:item.identifier];
        }
    }
    return voice;
}

- (AVSpeechUtterance *)_speechUtteranceWithItem:(AKSpeechModel *)item {
    if (item.contentAttributeText.length <= 0) {
        if (item.contentText.length <= 0) {
            NSAssert(item.contentText.length > 0, @"输入的内容不能够为空");
            return nil;
        }else{
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:item.contentText];
            return utterance;
        }
    }else {
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithAttributedString:item.contentAttributeText];
        return utterance;
    }
}

- (AVSpeechUtterance *)_configureUtteranceWithItem:(AKSpeechModel *)item voice:(AVSpeechSynthesisVoice *)voice {
    AVSpeechUtterance *utterance = [self _speechUtteranceWithItem:item];
    utterance.rate = item.rate;
    NSAssert((item.pitchMultiPlier >= 0.8) && (item.pitchMultiPlier < 2.0f),@"输入的pitch 参数必须是在【0.8-2.】");
    utterance.pitchMultiplier = item.pitchMultiPlier;
    utterance.volume = item.volume;
    utterance.preUtteranceDelay = item.preUtteranceDelay;
    utterance.postUtteranceDelay = item.postUtteranceDelay;
    utterance.voice = voice;
    return utterance;
}

#pragma mark -- delegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"开始播放声音");
    !_deleegateBlock?:_deleegateBlock(synthesizer, utterance, NSMakeRange(0, 0), AKASpeechDelegateTypeDidStart);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"语音播放结束");
    !_deleegateBlock?:_deleegateBlock(synthesizer, utterance, NSMakeRange(0, 0), AKASpeechDelegateTypeDidFinish);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"语音播放暂停");
    !_deleegateBlock?:_deleegateBlock(synthesizer, utterance, NSMakeRange(0, 0), AKASpeechDelegateTypeDidPause);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"语音播放继续");
    !_deleegateBlock?:_deleegateBlock(synthesizer, utterance, NSMakeRange(0, 0), AKASpeechDelegateTypeDidContinue);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance *)utterance {
    NSLog(@"放弃语音播放");
    !_deleegateBlock?:_deleegateBlock(synthesizer, utterance, NSMakeRange(0, 0), AKASpeechDelegateTypeDidCancel);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer willSpeakRangeOfSpeechString:(NSRange)characterRange utterance:(AVSpeechUtterance *)utterance {
    NSLog(@"正在播放的文字： %@",[utterance.speechString substringWithRange:characterRange]);
    !_deleegateBlock?:_deleegateBlock(synthesizer, utterance, characterRange, AKASpeechDelegateTypeWillSpeakRangeOfString);
}

@end
