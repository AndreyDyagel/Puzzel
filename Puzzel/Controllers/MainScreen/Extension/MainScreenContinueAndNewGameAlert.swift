//
//  MainScreenContinueAndNewGameAlert.swift
//  Puzzel
//
//  Created by Андрей on 15.01.2021.
//

import UIKit

extension MainScreenViewController {
    
    func newGameAndContinue(_ controller: GameScreenViewController) {
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
        let newGame = UIAlertAction(title: "Новая игра",
                                    style: .default) { (_) in
            self.playActionButton()
        }
        let continueGame = UIAlertAction(title: "Продолжить игру",
                                         style: .default) { (_) in
            if controller.pauseButtonOutlet.titleLabel?.text == "Продолжить" {
                self.navigationController?.settingNavigationController()
            } else {
                controller.startGameTime()
                self.navigationController?.settingNavigationController()
            }
            self.navigationController?.pushViewController(controller, animated: true)
        }
        let cancel = UIAlertAction(title: "Отмена",
                                   style: .cancel) { (_) in
            self.falseButtonIsSelected()
            self.removeAllAnimated()
        }
        cancel.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertController.addAction(newGame)
        alertController.addAction(continueGame)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
}
