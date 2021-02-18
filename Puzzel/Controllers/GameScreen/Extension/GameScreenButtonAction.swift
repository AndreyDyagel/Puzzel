//
//  GameScreenButtonAction.swift
//  Puzzel
//
//  Created by Андрей on 30.12.2020.
//

import UIKit

extension GameScreenViewController {
    
    func gamePause(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "Пауза" {
            sender.setTitle("Продолжить", for: .normal)
            sender.shadow(offset: CGSize.init(width: 3, height: 3), color: .green, radius: 5, opacity: 1)
            timer?.invalidate()
            viewGameOutlet.isUserInteractionEnabled = false
            viewGameOutlet.alpha = 0.5
        } else if sender.titleLabel?.text == "Продолжить" {
            sender.setTitle("Пауза", for: .normal)
            sender.shadow(offset: CGSize.init(width: 3, height: 3), color: .red, radius: 5, opacity: 1)
            startGameTime()
            viewGameOutlet.isUserInteractionEnabled = true
            viewGameOutlet.alpha = 1
        }
    }
    
}

