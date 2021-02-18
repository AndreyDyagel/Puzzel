//
//  GameBoardCell.swift
//  Puzzel
//
//  Created by Андрей on 12.01.2021.
//

import UIKit

class GameBoardCell: UIView {

    @IBOutlet private weak var numberLabel: UILabel!
    
    var onAction: (()->())?
    
    @IBAction private func buttonPress(_ sender: UIButton) {
        
        if let action = onAction {
            action()
        }
    }
    
    func setupCell(_ model: GameBoardCellModel) {
        numberLabel.text = String(model.number)
        numberLabel.textColor = .white
        numberLabel.font = UIFont(name: "Arial", size: 40)
        if model.type == .empty {
            isUserInteractionEnabled = false
            alpha = 0
        }
    }
}
