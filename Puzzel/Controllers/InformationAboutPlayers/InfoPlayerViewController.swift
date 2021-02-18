//
//  InfoPlayerViewController.swift
//  Puzzel
//
//  Created by Андрей on 19.01.2021.
//

import UIKit

class InfoPlayerViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var clearPlayerListOutlet: UIButton!

    var arrays: (([String], [String])->())?
    var arrayNamePlayer = [String]()
    var arrayTimer = [String]()
    var numberOfGames = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearPlayerListOutlet.layer.cornerRadius = 10
        tableViewOutlet.reloadData()
    }
    
    @IBAction func clearPlayerList(_ sender: UIButton) {
        
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "time")
        arrayNamePlayer.removeAll()
        arrayTimer.removeAll()
        
        if let array = arrays {
            array(arrayNamePlayer, arrayTimer)
        }
        
        tableViewOutlet.reloadData()
    }
}

extension InfoPlayerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Game Results"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNamePlayer.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CusstomCellTableViewCell
        cell.selectionStyle = .none
        cell.namePlayer.text = arrayNamePlayer[indexPath.row]
        cell.timerOutlet.text = arrayTimer[indexPath.row]
        
        if numberOfGames <= arrayNamePlayer.count {
            cell.numberOutlet.text = "\(numberOfGames)"
            numberOfGames += 1
        }
        return cell
    }
}
