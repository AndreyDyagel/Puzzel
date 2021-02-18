//
//  MainScreenButtonsAction.swift
//  Puzzel
//
//  Created by Андрей on 30.12.2020.
//

import UIKit

extension MainScreenViewController {
    
    func actionButton(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            isSelectedButtons(buttonZeroTag: true, buttonOneTag: false, buttronTwoTag: false, buttonThreeTag: false)
            buttonAnimate(sender)
        case 1:
            isSelectedButtons(buttonZeroTag: false, buttonOneTag: true, buttronTwoTag: false, buttonThreeTag: false)
            buttonAnimate(sender)
        case 2:
            isSelectedButtons(buttonZeroTag: false, buttonOneTag: false, buttronTwoTag: true, buttonThreeTag: false)
            buttonAnimate(sender)
        case 3:
            isSelectedButtons(buttonZeroTag: false, buttonOneTag: false, buttronTwoTag: false, buttonThreeTag: true)
            buttonAnimate(sender)
        default:
            break
        }
    }
    
    func playActionButton() {
        
        if button3x3Outlet.isSelected == true {
            letsPlay(title: button3x3Outlet.titleLabel?.text ?? "")
        } else if button4x4Outlet.isSelected == true {
            letsPlay(title: button4x4Outlet.titleLabel?.text ?? "")
        } else if button5x5Outlet.isSelected == true {
            letsPlay(title: button5x5Outlet.titleLabel?.text ?? "")
        } else if button6x6Outlet.isSelected == true {
            letsPlay(title: button6x6Outlet.titleLabel?.text ?? "")
        } else {
            alert(title: "Внимание!", message: "Выберите уровень сложности игры")
        }
    }
    
    func playGame() {
        
        if gameScreenViewController == nil || results == true {
            playActionButton()
            results = false
        } else {
            if gameScreenViewController?.row == Level.easy.rawValue && button3x3Outlet.isSelected == true {
                newGameAndContinue(gameScreenViewController!)
            } else if gameScreenViewController?.row == Level.medium.rawValue && button4x4Outlet.isSelected == true {
                newGameAndContinue(gameScreenViewController!)
            } else if gameScreenViewController?.row == Level.hard.rawValue && button5x5Outlet.isSelected == true {
                newGameAndContinue(gameScreenViewController!)
            } else if gameScreenViewController?.row == Level.professional.rawValue && button6x6Outlet.isSelected == true {
                newGameAndContinue(gameScreenViewController!)
            } else {
                playActionButton()
            }
        }
    }
}
