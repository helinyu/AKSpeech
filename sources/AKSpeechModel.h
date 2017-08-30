//
//  AKSpeechModel.h
//  AKSpeech
//
//  Created by Aka on 2017/8/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AKSpeechModel : NSObject

//constant enum
@property (nonatomic, assign) AVSpeechBoundary *speechBoundary;
@property (nonatomic, assign) AVSpeechSynthesisVoiceQuality *voiceQuality;

//AVF_EXPORT const float AVSpeechUtteranceMinimumSpeechRate NS_AVAILABLE_IOS(7_0); 0
//AVF_EXPORT const float AVSpeechUtteranceMaximumSpeechRate NS_AVAILABLE_IOS(7_0); 1
//AVF_EXPORT const float AVSpeechUtteranceDefaultSpeechRate NS_AVAILABLE_IOS(7_0); 0.5

//// Use the Alex identifier with voiceWithIdentifier:. If the voice is present on the system,
//// an AVSpeechSynthesisVoice will be returned. Alex is en-US only.
//AVF_EXPORT NSString *const AVSpeechSynthesisVoiceIdentifierAlex NS_AVAILABLE_IOS(9_0);
////NSString, containing International Phonetic Alphabet (IPA) symbols. Controls pronunciation of a certain word or phrase, e.g. a proper name.
//AVF_EXPORT NSString *const AVSpeechSynthesisIPANotationAttribute API_AVAILABLE(ios(10.0), watchos(3.0), tvos(10.0));

//AVSpeechSynthesisVoice class
@property (nonatomic, copy) NSString *language;  // 优先权高于identifier
@property (nonatomic, copy) NSString *identifier;
//@property(nonatomic, readonly) NSString *language;
//@property(nonatomic, readonly) NSString *identifier;
//@property(nonatomic, readonly) NSString *name;
//@property(nonatomic, readonly) AVSpeechSynthesisVoiceQuality quality;

//AVSpeechUtterance class
@property (nonatomic, copy) NSAttributedString *contentAttributeText; // 优先权高于content
@property (nonatomic, copy) NSString *contentText;
@property (nonatomic, assign) float rate; //[0-1]  测试出来的内容 默认是o.5
@property (nonatomic, assign) float pitchMultiPlier; //[0.5 -2]
@property (nonatomic, assign) float volume;  //[0-1]
@property (nonatomic, assign) NSTimeInterval preUtteranceDelay;
@property (nonatomic, assign) NSTimeInterval postUtteranceDelay;

//+ (instancetype)speechUtteranceWithString:(NSString *)string;
//+ (instancetype)speechUtteranceWithAttributedString:(NSAttributedString *)string API_AVAILABLE(ios(10.0), watchos(3.0), tvos(10.0));
//
//- (instancetype)initWithString:(NSString *)string;
//- (instancetype)initWithAttributedString:(NSAttributedString *)string API_AVAILABLE(ios(10.0), watchos(3.0), tvos(10.0));
//
///* If no voice is specified, the system's default will be used. */
//@property(nonatomic, retain, nullable) AVSpeechSynthesisVoice *voice;
//@property(nonatomic, readonly) NSString *speechString;
//@property(nonatomic, readonly) NSAttributedString *attributedSpeechString API_AVAILABLE(ios(10.0), watchos(3.0), tvos(10.0));

//AVSpeechSynthesizer
//@property(nonatomic, weak, nullable) id<AVSpeechSynthesizerDelegate> delegate;
//@property(nonatomic, readonly, getter=isSpeaking) BOOL speaking;
//@property(nonatomic, readonly, getter=isPaused) BOOL paused;
/* These methods will operate on the speech utterance that is speaking. Returns YES if it succeeds, NO for failure. */

/* Call stopSpeakingAtBoundary: to interrupt current speech and clear the queue. */
//- (BOOL)stopSpeakingAtBoundary:(AVSpeechBoundary)boundary;
//- (BOOL)pauseSpeakingAtBoundary:(AVSpeechBoundary)boundary;
//- (BOOL)continueSpeaking;
// Specify the audio channels to be used for synthesized speech as described by the channel descriptions in AVAudioSession's current route.
// Speech audio will be replicated to each specified channel.
// Default is nil, which implies system defaults.
//@property(nonatomic, retain, nullable) NSArray<AVAudioSessionChannelDescription *> *outputChannels API_AVAILABLE(ios(10.0), watchos(3.0), tvos(10.0));


@end
