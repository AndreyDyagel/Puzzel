//
//  UINavigationController + Extension.swift
//  Puzzel
//
//  Created by Андрей on 23.12.2020.
//

import UIKit

extension UINavigationController {
    
    func settingNavigationController() {
        navigationBar.isHidden = false
        navigationBar.backgroundColor = .clear
        navigationBar.topItem?.backButtonTitle = "Назад"
        navigationBar.tintColor = .black
        navigationBar.titleTextAttributes  = [ NSAttributedString.Key.foregroundColor : UIColor.black
        ]
    }
}
