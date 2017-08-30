//
//  AKASpeechDefine.h
//  TestAudio
//
//  Created by Aka on 2017/8/30.
//  Copyright © 2017年 Aka. All rights reserved.
//

#ifndef AKASpeechDefine_h
#define AKASpeechDefine_h

typedef NS_ENUM(NSInteger, AKASpeechDelegateType) {
    AKASpeechDelegateTypeDidStart = 0,
    AKASpeechDelegateTypeDidFinish,
    AKASpeechDelegateTypeDidPause,
    AKASpeechDelegateTypeDidContinue,
    AKASpeechDelegateTypeDidCancel,
    AKASpeechDelegateTypeWillSpeakRangeOfString,
};

#endif /* AKASpeechDefine_h */
