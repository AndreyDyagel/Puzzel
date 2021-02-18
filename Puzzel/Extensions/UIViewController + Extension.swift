//
//  UIViewController + Extension.swift
//  Puzzel
//
//  Created by Андрей on 23.12.2020.
//

import UIKit

extension UIViewController {
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

