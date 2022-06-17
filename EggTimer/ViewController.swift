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
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var discriptionLbl: UILabel!
    
    let eggTimes = ["Soft": 3, "Meduim": 4, "Hard": 7]
    var secondsPassed = 0
    var totalTime = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    var isEggDone: Bool = false
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        timer.invalidate()
        progressBar.progress = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        
    
        //MARK: Timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
     
    }
    
    func playSound() {

        ////Short Version
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.setProgress(percentageProgress, animated: true)
        }
        else{
            discriptionLbl.text = "Done"
            isEggDone = true
           
            if isEggDone{
                playSound()
            }
            timer.invalidate()
        }
    }
    
}
