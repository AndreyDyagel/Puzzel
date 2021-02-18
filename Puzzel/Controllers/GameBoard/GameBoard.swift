//
//  GameBoard.swift
//  Puzzel
//
//  Created by Андрей on 12.01.2021.
//

import UIKit

enum GameBoardCellType {
    case empty
    case full
    
}

class GameBoardCellModel: NSObject {

    var number: Int
    var type: GameBoardCellType
    
    init(number: Int, type: GameBoardCellType) {
        self.number = number
        self.type = type
    }
}
