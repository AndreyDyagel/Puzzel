//
//  GameScreenGameField.swift
//  Puzzel
//
//  Created by Андрей on 24.12.2020.
//

import UIKit

extension GameScreenViewController {
    
    func gameField() {
        
        switch levelGame {
        case "3X3":
            row = Level.easy.rawValue
        case "4X4":
            row = Level.medium.rawValue
        case "5X5":
            row = Level.hard.rawValue
        case "6X6":
            row = Level.professional.rawValue
        default:
            break
        }
        
        for rows in 0..<row {
            var rowArray: [GameBoardCellModel] = []
            for column in 1...row {
                let currentCellNumber = rows * row + column
                var type: GameBoardCellType
                if currentCellNumber != row * row {
                    type = .full
                } else {
                    type = .empty
                }
                let cell = GameBoardCellModel(number: currentCellNumber, type: type)
                rowArray.append(cell)
                if type == .empty {
                    emptyCell = cell
                }
            }
            data.append(rowArray)
//            data.shuffle()
        }
        updateBoard()
    }
    
    func updateBoard() {
        
        for view in viewGameOutlet.subviews {
            view.removeFromSuperview()
        }
        
        let size = (viewGameOutlet.frame.width / CGFloat(row)) - 0.5
        var x: CGFloat = indents
        var y: CGFloat = indents
        
        for row in data {
            for cellModal in row {
                if let cell = UINib(nibName: "GameBoardCell", bundle: nil).instantiate(withOwner: self, options: nil).first as? GameBoardCell {
                    cell.frame = CGRect(x: x, y: y, width: size - indents, height: size - indents)
                    cell.layer.cornerRadius = 10
                    cell.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    cell.onAction = { [unowned self] in
                        self.moveEmptyCellToIndex(indexOfCell(cellModal))
                        self.checkIfFinishGame()
                    }
                    cell.setupCell(cellModal)
                    viewGameOutlet.addSubview(cell)
                }
                x += size
            }
            x = indents
            y += size
        }
    }
    
    func moveEmptyCellToIndex(_ index: Index?) {
        guard let emptyCell = emptyCell,
              let index = index,
              var emptyCellIndex = indexOfEmptyCell() else {
            return
        }
        
        if emptyCellIndex.row == index.row {
            let delta = emptyCellIndex.column > index.column ? -1 : 1
            while emptyCellIndex.column != index.column  {
                let indexToSwap = Index(row: emptyCellIndex.row, column: emptyCellIndex.column + delta)
                swapTwoCells(emptyCell, secondCellModel: data[indexToSwap.row][indexToSwap.column])
                emptyCellIndex = indexToSwap
            }
        } else if emptyCellIndex.column == index.column {
            let delta = emptyCellIndex.row > index.row ? -1 : 1
            while emptyCellIndex.row != index.row  {
                let indexToSwap = Index(row: emptyCellIndex.row + delta, column: emptyCellIndex.column)
                swapTwoCells(emptyCell, secondCellModel: data[indexToSwap.row][indexToSwap.column])
                emptyCellIndex = indexToSwap
            }
        }
    }
    
    func checkIfFinishGame() {
        var numberOfCorrectElements = 0
        
        for rowIndex in 0..<row {
            for columnIndex in 0..<row {
                let currentCellNumber = rowIndex * row + columnIndex + 1
                if currentCellNumber == data[rowIndex][columnIndex].number {
                    numberOfCorrectElements += 1
                }
            }
        }
        if numberOfCorrectElements == row * row {
            saveGameResults()
        }
    }
    
    func saveGameResults() {
        timer?.invalidate()
        viewGameOutlet.alpha = 0.5
        viewGameOutlet.isUserInteractionEnabled = false
        alertFinishGame(title: "Поздравляем!", message: "Время вашей игры \(timerLabelOutlet.text ?? "")") { (string) in
            self.viewGameOutlet.alpha = 1
            self.pauseButtonOutlet.isHidden = true
            
            self.dismiss(animated: true) {
                if let name = self.playerTimerGame {
                    if !string.isEmpty {
                        name("\(string) - \(self.levelGame)", self.timerLabelOutlet.text ?? "")
                    } else {
                        var namePlayer = string
                        namePlayer = "Default"
                        name("\(namePlayer) - \(self.levelGame)", self.timerLabelOutlet.text ?? "")
                    }
                }
            }
        }
    }
    
    func swapTwoCells(_ firstCellModel: GameBoardCellModel, secondCellModel: GameBoardCellModel) {
        guard let firstIndex = indexOfCell(firstCellModel),
              let secondIndex = indexOfCell(secondCellModel) else {
            return
        }
  
        self.data[firstIndex.row][firstIndex.column] = secondCellModel
        self.data[secondIndex.row][secondIndex.column] = firstCellModel
        updateBoard()
    }
    
    func indexOfCell(_ cellModal: GameBoardCellModel?) -> Index? {
        guard let cellModal = cellModal else { return nil }
        for rowIndex in 0..<row {
            for columnIndex in 0..<row {
                let cell = data[rowIndex][columnIndex]
                if cell == cellModal {
                    return Index(row: rowIndex, column: columnIndex)
                }
            }
        }
        return nil
    }
    
    func indexOfEmptyCell() -> Index? {
        return indexOfCell(emptyCell)
    }
    
}


