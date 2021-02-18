//
//  GameScreenViewController.swift
//  Puzzel
//
//  Created by Андрей on 15.12.2020.
//

import UIKit

class GameScreenViewController: UIViewController {
    
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    @IBOutlet weak var timerLabelOutlet: UILabel!
    @IBOutlet weak var viewGameOutlet: UIView!
    
    let finish = true
    let indents: CGFloat = 2
    var levelGame = ""
    var emptyCell: GameBoardCellModel?
    var data: [[GameBoardCellModel]] = []
    var gameScreenViewController: GameScreenViewController?
    var timer: Timer?
    var swipeView = UIView()
    var bool = true
    var time = 0
    var row = 0
    var gameFinish: ((Bool) -> ())?
    var playerTimerGame: ((String, String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.settingNavigationController()
        pauseButtonOutlet.shadow(offset: CGSize.init(width: 3, height: 3), color: .red, radius: 5, opacity: 1)
        startGameTime()
        viewGameOutlet.alphaAndRadius()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if bool == true {
            gameField()
            bool = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        
        gamePause(sender)
    }
    
}
