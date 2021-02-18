//
//  GameScreenPlayTime.swift
//  Puzzel
//
//  Created by Андрей on 28.12.2020.
//

import UIKit

extension GameScreenViewController {

    func startGameTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }

   @objc func updateTimer() {
        time += 1
        timerLabelOutlet.text = timeString(time: TimeInterval(time))
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
