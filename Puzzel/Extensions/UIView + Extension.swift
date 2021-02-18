//
//  UIView + Extension.swift
//  Puzzel
//
//  Created by Андрей on 22.12.2020.
//

import UIKit

extension UIView {
    
    func shadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
    }
    
    func alphaAndRadius() {
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        layer.cornerRadius = 10
    }
}
