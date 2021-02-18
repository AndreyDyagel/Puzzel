//
//  MainScreenButtonsSetting.swift
//  Puzzel
//
//  Created by Андрей on 30.12.2020.
//

import UIKit

extension MainScreenViewController {
    
    func isSelectedButtons(buttonZeroTag: Bool, buttonOneTag: Bool, buttronTwoTag: Bool, buttonThreeTag: Bool) {
        
        button3x3Outlet.isSelected = buttonZeroTag
        button4x4Outlet.isSelected = buttonOneTag
        button5x5Outlet.isSelected = buttronTwoTag
        button6x6Outlet.isSelected = buttonThreeTag
        
        if buttonZeroTag == true {
            removeAnimation(button4x4Outlet)
            removeAnimation(button5x5Outlet)
            removeAnimation(button6x6Outlet)
        } else if buttonOneTag == true {
            removeAnimation(button3x3Outlet)
            removeAnimation(button5x5Outlet)
            removeAnimation(button6x6Outlet)
        } else if buttronTwoTag == true {
            removeAnimation(button3x3Outlet)
            removeAnimation(button4x4Outlet)
            removeAnimation(button6x6Outlet)
        } else if buttonThreeTag == true {
            removeAnimation(button3x3Outlet)
            removeAnimation(button4x4Outlet)
            removeAnimation(button5x5Outlet)
        }
        
    }
    
    func falseButtonIsSelected() {
        button3x3Outlet.isSelected = false
        button4x4Outlet.isSelected = false
        button5x5Outlet.isSelected = false
        button6x6Outlet.isSelected = false
    }
    
    func removeAllAnimated() {
        removeAnimation(button3x3Outlet)
        removeAnimation(button4x4Outlet)
        removeAnimation(button5x5Outlet)
        removeAnimation(button6x6Outlet)
    }
    
    func addShadow() {
        button3x3Outlet.shadow(offset: CGSize.init(width: 3, height: 3), color: .black, radius: 10, opacity: 0.7)
        button4x4Outlet.shadow(offset: CGSize.init(width: 3, height: 3), color: .black, radius: 10, opacity: 0.7)
        button5x5Outlet.shadow(offset: CGSize.init(width: 3, height: 3), color: .black, radius: 10, opacity: 0.7)
        button6x6Outlet.shadow(offset: CGSize.init(width: 3, height: 3), color: .black, radius: 10, opacity: 0.7)
        playButtonOutlet.shadow(offset: CGSize.init(width: 4, height: 4), color: .black, radius: 10, opacity: 1)
        
    }
    
    func buttonAnimate(_ button: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            button.center.x += 5
            button.center.x -= 5
        }, completion: nil)
    }
    
    func removeAnimation(_ button: UIButton) {
        button.layer.removeAllAnimations()
    }
}

