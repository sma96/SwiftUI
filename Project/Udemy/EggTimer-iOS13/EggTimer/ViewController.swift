//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7]
    var secondsPassed: Float = 0
    var timer = Timer()
    var totalTime: Float = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = Float(eggTimes[hardness]!)
        progressBar.progress = 0
        label.text = hardness
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { Timer in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                print("\(self.secondsPassed) seconds")
            }
            if self.secondsPassed == self.totalTime{
                Timer.invalidate()
                self.label?.text = "Done"
                self.playSound()
            }
            self.progressBar.progress = self.secondsPassed / self.totalTime
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
