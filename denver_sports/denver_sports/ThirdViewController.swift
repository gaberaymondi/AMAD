//
//  ThirdViewController.swift
//  denver_sports
//
//  Created by Gabe Raymondi on 2/5/20.
//  Copyright © 2020 Gabe Raymondi. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    //variables
    let audioSession = AVAudioSession.sharedInstance()
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    
    let filename = "audio.m4a"
    
    @IBOutlet weak var recordAudio: UIButton!
    @IBOutlet weak var playAudio: UIButton!
    @IBOutlet weak var stopAudio: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get path for the audio file
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0]
        let audioFileURL = docDir.appendingPathComponent(filename)
        print(audioFileURL)
        
        //configure our audioSession
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord, mode: .default, options: .init(rawValue: 1))
        } catch {
            print("audio session error: \(error.localizedDescription)")
        }
        
        //declare our settings in a dictionary
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 1200, //sample rate in hZ
            AVNumberOfChannelsKey: 1, //num of channels
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue //audio bit rate
        ]
        
        do {
            //create our recorder instance
            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
            //get it ready for recording by creating the audio file at the specified location
            audioRecorder?.prepareToRecord()
            print("Audio recorder ready!")
        } catch {
            print("Audio recorder error: \(error.localizedDescription)")
        }
    }
    
    @IBAction func recordAudio(_ sender: Any) {
        //make sure we have an instance
        if let recorder = audioRecorder {
            //check to make sure we aren't already recording
            if recorder.isRecording == false {
                
                playAudio.isEnabled = false
                stopAudio.isEnabled = true
                recorder.delegate = self
                
                recorder.record()
            }
        } else {
            print("No audio recorder instance")
        }
    }
    
    @IBAction func playAudio(_ sender: Any) {
        //make sure we aren't recording
        if audioRecorder?.isRecording == false {
            
            stopAudio.isEnabled = true
            recordAudio.isEnabled = false
            
            do {
                
                try audioPlayer = AVAudioPlayer(contentsOf: (audioRecorder?.url)!)
                //set to playback mode for optimal volume
                try audioSession.setCategory(AVAudioSession.Category.playback)
                audioPlayer!.delegate = self
                audioPlayer!.prepareToPlay() //preload audio
                audioPlayer!.play() //plays audio file
    
            } catch {
                print("audioPlayer error: \(error.localizedDescription)")
            }
        }
        
        
    }
    
    @IBAction func stopAudio(_ sender: Any) {
        stopAudio.isEnabled = false
        playAudio.isEnabled = true
        recordAudio.isEnabled = true
        
        //stop recording if that's the current task
        if audioRecorder?.isRecording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
            //reset session mode
            do {
                try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        recordAudio.isEnabled = true
        stopAudio.isEnabled = false
        
        do {
            try audioSession.setCategory(AVAudioSession.Category.playAndRecord)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}
