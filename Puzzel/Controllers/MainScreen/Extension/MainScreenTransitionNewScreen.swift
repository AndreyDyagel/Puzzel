//
//  MainScreenTransitionNewScreen.swift
//  Puzzel
//
//  Created by Андрей on 30.12.2020.
//

import UIKit

extension MainScreenViewController {
    
    func letsPlay(title: String) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "GameScreenViewController") as! GameScreenViewController
        gameScreenViewController = newVC
        newVC.modalPresentationStyle = .fullScreen
        newVC.navigationItem.title = "\(gameNameOutlet.text ?? "") \(title)"
        newVC.levelGame = title
        newVC.playerTimerGame = { (name, time) in
            self.arrayNamePlayer.append(name)
            self.arrayTimer.append(time)
            UserDefaults.standard.setValue(self.arrayNamePlayer, forKey: "name")
            UserDefaults.standard.setValue(self.arrayTimer, forKey: "time")
        }
        newVC.gameFinish = { (results) in
            self.results = results
        }
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    func infoGame() {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "InfoPlayerViewController") as! InfoPlayerViewController
        newVC.modalPresentationStyle = .formSheet
        newVC.arrayNamePlayer = arrayNamePlayer
        newVC.arrayTimer = arrayTimer
        newVC.arrays = { (name, timer) in
            self.arrayNamePlayer = name
            self.arrayTimer = timer
        }
        falseButtonIsSelected()
        removeAllAnimated()
        
        present(newVC, animated: true, completion: nil)
    }
}
