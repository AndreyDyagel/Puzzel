//
//  MainScreenTextSetting.swift
//  Puzzel
//
//  Created by Андрей on 30.12.2020.
//

import UIKit

extension MainScreenViewController {
    
    func customNameGameText() {
        
        let nameGameMuttableStr = NSMutableAttributedString(string: "Пятнашки")
        let myShadow = NSShadow()
        myShadow.shadowBlurRadius = 3
        myShadow.shadowOffset = CGSize(width: 3, height: 3)
        myShadow.shadowColor = UIColor.black
        
        nameGameMuttableStr.addAttribute(.shadow, value: myShadow, range: _NSRange(location: 0, length: nameGameMuttableStr.length))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.red, range: _NSRange(location: 0, length: 1))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.orange, range: _NSRange(location: 1, length: 1))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.yellow, range: _NSRange(location: 2, length: 1))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.green, range: _NSRange(location: 3, length: 1))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.systemBlue, range: _NSRange(location: 4, length: 1))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.blue, range: _NSRange(location: 5, length: 1))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.purple, range: _NSRange(location: 6, length: 1))
        nameGameMuttableStr.addAttribute(.foregroundColor, value: UIColor.red, range: _NSRange(location: 7, length: 1))
        
        gameNameOutlet.attributedText = nameGameMuttableStr
        
    }
    
    func customStr() {
        let mutableStr = NSMutableAttributedString(string: "Добро пожаловать в игру ПЯТНАШКИ")
        let linkColor: [NSAttributedString.Key : Any] = [.foregroundColor : UIColor.blue]
        
        mutableStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 17), range: _NSRange(location: 0, length: mutableStr.length))
        mutableStr.addAttribute(.foregroundColor, value: UIColor.black, range: _NSRange(location: 0, length: mutableStr.length))
        mutableStr.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: _NSRange(location: 24, length: 8))
        mutableStr.addAttribute(.link, value: "https://ru.m.wikipedia.org/wiki/%D0%98%D0%B3%D1%80%D0%B0_%D0%B2_15", range: _NSRange(location: 24, length: 8))
        
        helloOutlet.linkTextAttributes = linkColor
        helloOutlet.attributedText = mutableStr
        helloOutlet.textAlignment = .center
        helloOutlet.isEditable = false

        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            UIApplication.shared.open(URL)
            return false
        }
    }
    

}
