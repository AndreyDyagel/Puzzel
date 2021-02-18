//
//  MainScreenViewController.swift
//  Puzzel
//
//  Created by Андрей on 15.12.2020.
//

import UIKit

class MainScreenViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var button3x3Outlet: UIButton!
    @IBOutlet weak var button4x4Outlet: UIButton!
    @IBOutlet weak var button5x5Outlet: UIButton!
    @IBOutlet weak var button6x6Outlet: UIButton!
    @IBOutlet weak var playButtonOutlet: UIButton!
    @IBOutlet weak var gameNameOutlet: UILabel!
    @IBOutlet weak var helloOutlet: UITextView!
    
    var results = false
    var gameScreenViewController: GameScreenViewController?
    var arrayNamePlayer = UserDefaults.standard.array(forKey: "name") as? [String] ?? [String]()
    var arrayTimer = UserDefaults.standard.array(forKey: "time") as? [String] ?? [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        helloOutlet.delegate = self
        addShadow()
        customNameGameText()
        customStr()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationController?.navigationBar.isHidden = true
        falseButtonIsSelected()
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        playGame()
    }
    
    @IBAction func buttonsAction(_ sender: UIButton) {
        actionButton(sender)
    }
    
    @IBAction func infoAction(_ sender: UIButton) {
        infoGame()
    }
    
}

