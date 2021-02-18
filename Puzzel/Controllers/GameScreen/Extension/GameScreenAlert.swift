//
//  GameScreenAlert.swift
//  Puzzel
//
//  Created by Андрей on 08.01.2021.
//

import UIKit

extension GameScreenViewController {
    
    func alertFinishGame(title: String, message: String, with complition: @escaping (String) -> ()) {
      
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        var alertTextField: UITextField!
        
        let okAction = UIAlertAction(title: "Сохранить",
                                     style: .default) { _ in
            complition(alertTextField.text ?? "Default")
            if let game = self.gameFinish {
                game(self.finish)
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Отмена",
                                         style: .destructive) {_ in
            self.viewGameOutlet.alpha = 1
            self.timer?.invalidate()
            self.pauseButtonOutlet.isHidden = true
            if let game = self.gameFinish {
                game(self.finish)
            }
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        alert.addTextField { textField in
            alertTextField = textField
        }
        
        present(alert, animated: true)
    }
}
