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
    let eggTimers=["Soft":180,"Medium":420,"Hard":720]
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var labelView: UILabel!
    
    var timer=Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    

    @IBOutlet weak var timerLabel: UILabel!
    var totalTime=0
    var secondsPassed=0
    var counter=false
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if(counter){
            player.stop()
        }
        labelView.text="How do you like your eggs?"
        timerLabel.text="How much time is left??"
        progressBar.progress=0.0
        secondsPassed=0
        timer.invalidate()
        
        
        let hardness=sender.currentTitle!
        totalTime=eggTimers[hardness]!
        
        
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if self.secondsPassed < self.totalTime {
                self.secondsPassed += 1
                UIView.animate(withDuration: 0.2) {
                    self.progressBar.progress=Float(self.secondsPassed)/Float(self.totalTime)
                }
                UIView.animate(withDuration: 0.2) {
                    self.timerLabel.text="\(self.totalTime-self.secondsPassed) Seconds."
                }
                } else {
                    self.labelView.text="Done!"
                    self.playSound()
                    self.counter=true
                    Timer.invalidate()
                }
            }
        
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }

    

}
