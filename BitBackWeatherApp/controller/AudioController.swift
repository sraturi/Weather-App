//
//  AudioController.swift
//  BitBackWeatherApp
//
//  Created by Sachin Raturi on 2021-03-19.
//

import Foundation
import AVFoundation

class  AudioController {
    // singleton pattern
    private static var controller: AudioController?
    
    static func getInstance() -> AudioController{
        if controller == nil {
            controller = AudioController()
        }
        return controller!
    }
    
    let speaker: AVSpeechSynthesizer
    
    private init(){
        speaker = AVSpeechSynthesizer()
    }
    
    func speakText(text:String) {
        if speaker.isSpeaking {
            speaker.stopSpeaking(at: .word)
            return
        }
        var utterance: AVSpeechUtterance {
            AVSpeechUtterance(string: text)
        }
        self.speaker.speak(utterance)
    }
    
}

